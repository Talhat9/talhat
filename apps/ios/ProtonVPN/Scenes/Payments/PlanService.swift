//
//  PlanService.swift
//  ProtonVPN
//
//  Created by Igor Kulman on 01.09.2021.
//  Copyright © 2021 Proton Technologies AG. All rights reserved.
//

import Foundation
import ProtonCore_Payments
import ProtonCore_PaymentsUI
import vpncore

protocol PlanServiceFactory {
    func makePlanService() -> PlanService
}

protocol PlanService {
    var allowUpgrade: Bool { get }
    var allowPlanManagement: Bool { get }

    func presentPlanSelection()
    func presentSubscriptionManagement()
    func updateServicePlans()

    func clear()
}

final class CorePlanService: PlanService {
    private let paymentsUI: PaymentsUI
    private let payments: Payments
    private let alertService: AlertService
    private let appSessionManager: AppSessionManager
    private let userCachedStatus: UserCachedStatus

    let tokenStorage: PaymentTokenStorage?

    var allowUpgrade: Bool {
        return userCachedStatus.isIAPUpgradePlanAvailable
    }

    var allowPlanManagement: Bool {
        return !allowUpgrade
    }

    init(networking: CoreNetworking, alertService: AlertService, appSessionManager: AppSessionManager) {
        self.alertService = alertService
        self.appSessionManager = appSessionManager

        tokenStorage = TokenStorage()
        userCachedStatus = UserCachedStatus()
        payments = Payments(
            inAppPurchaseIdentifiers: ObfuscatedConstants.vpnIAPIdentifiers,
            apiService: networking.apiService,
            localStorage: userCachedStatus,
            reportBugAlertHandler: { receipt in
                PMLog.ET("Error from payments?")
            }
        )
        paymentsUI = PaymentsUI(payments: payments)
    }

    func updateServicePlans() {
        payments.storeKitManager.delegate = self
        payments.storeKitManager.subscribeToPaymentQueue()
        payments.storeKitManager.updateAvailableProductsList { error in
            if let error = error {
                PMLog.ET("Updating plans failed: \(error)")
                return
            }

            PMLog.D("Plans updated")
        }
    }

    func presentPlanSelection() {
        guard userCachedStatus.isIAPUpgradePlanAvailable else {
            alertService.push(alert: UpgradeUnavailableAlert())
            return
        }

        paymentsUI.showUpgradePlan(presentationType: PaymentsUIPresentationType.modal, backendFetch: true, updateCredits: true) { [weak self] response in
            self?.handlePaymentsResponse(response: response)
        }
    }

    func presentSubscriptionManagement() {
        paymentsUI.showCurrentPlan(presentationType: PaymentsUIPresentationType.modal, backendFetch: true, updateCredits: true) { [weak self] response in
            self?.handlePaymentsResponse(response: response)
        }
    }

    func clear() {
        tokenStorage?.clear()
        userCachedStatus.clear()
    }

    private func handlePaymentsResponse(response: PaymentsUIResultReason) {
        switch response {
        case let .purchasedPlan(accountPlan: plan):
            PMLog.D("Purchased plan: \(plan)")
        case let .open(vc: _, opened: opened):
            assert(opened == true)
        default:
            break
        }
    }
}

extension CorePlanService: StoreKitManagerDelegate {
    var isUnlocked: Bool {
        return true
    }

    var isSignedIn: Bool {
        return true
    }

    var activeUsername: String? {
        guard let credentials = AuthKeychain.fetch() else {
            return nil
        }

        return credentials.username
    }

    var userId: String? {
        guard let credentials = AuthKeychain.fetch() else {
            return nil
        }

        return credentials.userId
    }
}