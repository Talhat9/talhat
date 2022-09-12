//
//  Created on 18.02.2022.
//
//  Copyright (c) 2022 Proton AG
//
//  ProtonVPN is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  ProtonVPN is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with ProtonVPN.  If not, see <https://www.gnu.org/licenses/>.

import Foundation

public final class NetShieldPropertyProviderMock: NetShieldPropertyProvider {
    public var lastActiveNetShieldType: NetShieldType = .level1

    public var factory: Factory

    public static var netShieldNotification: Notification.Name = Notification.Name("")

    public required init(_ factory: Factory) {
        self.factory = factory
    }

    public convenience init() {
        self.init(PaidFeaturePropertyProviderFactoryMock())
    }

    public var netShieldType: NetShieldType = .off    

    public var isUserEligibleForNetShield: Bool = true

    public func resetForIneligibleUser() {
        netShieldType = .off
    }
}
