//
//  OVPNCredentialsConfigurator.swift
//  ProtonVPN-mac
//
//  Created by Jaroslav on 2021-08-09.
//  Copyright © 2021 Proton Technologies AG. All rights reserved.
//

import Foundation
import NetworkExtension
import vpncore
import LocalFeatureFlags
import VPNShared
import TunnelKit

final class OVPNCredentialsConfigurator: VpnCredentialsConfigurator {
    
    private let xpcServiceUser: XPCServiceUser
    private let vpnAuthentication: VpnAuthentication
    private let appGroup: String
    
    init(xpcServiceUser: XPCServiceUser, vpnAuthentication: VpnAuthentication, appGroup: String) {
        self.xpcServiceUser = xpcServiceUser
        self.vpnAuthentication = vpnAuthentication
        self.appGroup = appGroup
    }
    
    func prepareCredentials(for protocolConfig: NEVPNProtocol, configuration: VpnManagerConfiguration, completionHandler: @escaping (NEVPNProtocol) -> Void) {
        guard isEnabled(OpenVPNFeature.macCertificates) else { // Old flow
            protocolConfig.username = configuration.username // Needed to detect connections started from another user (see AppSessionManager.resolveActiveSession)

            xpcServiceUser.setCredentials(username: configuration.username, password: configuration.password, completionHandler: { success in
                log.info("Credentials set result (ovpn): \(success ? "success" : "failure")", category: .sysex)
                completionHandler(protocolConfig)
            })
            return
        }

        // Username is needed to detect connections started from another user (see
        // `AppSessionManager.resolveActiveSession`). OpenVPN NE deletes this field before passing
        // it down to TunnelKit (this is not back propagated to the app though, so we can still use
        // it here).
        protocolConfig.username = configuration.username

        self.vpnAuthentication.loadAuthenticationData(features: nil) { result in
            switch result {
            case .success(let authenticationData):

                guard let tunnelProviderProtocol = protocolConfig as? NETunnelProviderProtocol,
                      let providerConfig = tunnelProviderProtocol.providerConfiguration else {
                    log.error("ProtocolConfiguration not set")
                    assertionFailure("Wrong protocol configuration was passed")
                    completionHandler(protocolConfig)
                    return
                }

                let ovpnConfig: OpenVPNTunnelProvider.Configuration
                do {
                    ovpnConfig = try OpenVPNTunnelProvider.Configuration.parsed(from: providerConfig)
                } catch let error {
                    log.error("Can't parse OpenVPN config from given NETunnelProviderProtocol: \(error)")
                    assertionFailure("OpenVPNTunnelProvider.Configuration was not saved in tunnelProviderProtocol.providerConfiguration")
                    completionHandler(protocolConfig)
                    return
                }

                let backup = tunnelProviderProtocol.backupCustomSettings()
                var ovpnBuilder = ovpnConfig.builder()
                var sessionBuilder = ovpnBuilder.sessionConfiguration.builder()

                // Client key and certificate have to be passed to OpenVPN for it to be able to connect. Later, LocalAgent can change features without replacing the certificate.
                sessionBuilder.clientKey = OpenVPN.CryptoContainer(pem: authenticationData.clientKey.derRepresentation) // ed25519
                sessionBuilder.clientCertificate = OpenVPN.CryptoContainer(pem: authenticationData.clientCertificate)

                ovpnBuilder.sessionConfiguration = sessionBuilder.build()
                tunnelProviderProtocol.providerConfiguration = ovpnBuilder.build().generatedProviderConfiguration(appGroup: self.appGroup)
                tunnelProviderProtocol.restoreCustomSettingsFrom(backup: backup)

                completionHandler(tunnelProviderProtocol)

            case .failure(let error):
                log.error("Error refreshing certificate", category: .userCert, metadata: ["error": "\(error)"])
                completionHandler(protocolConfig)
            }
        }
    }
    
}
