//
//  Created on 2022-02-10.
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

import BugReport
import SwiftUI

extension BugReport.Colors {
    public init() {
        self.init(primary: Color(.brandLighten20Color()),
                  interactive: Color(.brandColor()),
                  interactiveSecondary: Color(.brandLighten20Color()),
                  interactiveActive: Color(.brandLighten40Color()),
                  interactiveDisabled: Color(.brandDarken40Color()),
                  textPrimary: Color(.normalTextColor()),
                  textSecondary: Color(.weakTextColor()),
                  textAccent: Color(.textAccent()),
                  background: Color(.backgroundColor()),
                  backgroundWeak: Color(.secondaryBackgroundColor()),
                  backgroundStrong: nil,
                  backgroundUpdateButton: Color(.weakInteractionColor()),
                  separator: Color(.normalSeparatorColor()),
                  qfIcon: Color(.notificationWarningColor()),
                  externalLinkIcon: Color(.iconHint())
        )
    }
}
