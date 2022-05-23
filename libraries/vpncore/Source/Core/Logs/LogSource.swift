//
//  LogFilesProvider.swift
//  Core
//
//  Created by Jaroslav on 2021-06-04.
//  Copyright © 2021 Proton Technologies AG. All rights reserved.
//

import Foundation

public enum LogSource: CaseIterable {
    case app
    case openvpn
    case wireguard

    public var title: String {
        switch self {
        case .app: return LocalizedString.applicationLogs
        case .openvpn: return LocalizedString.openVpnLogs
        case .wireguard: return LocalizedString.wireguardLogs
        }
    }
}