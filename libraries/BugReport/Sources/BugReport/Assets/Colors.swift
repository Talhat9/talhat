//
//  Created on 2022-01-04.
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
import SwiftUI

/// All the colors used through this module. Colors.testColors is for testing purposes only. Apps should provide their own set of colors.
@available(iOS 14.0, *)
public struct Colors {

    public init(brand: Color, brandLight20: Color, brandLight40: Color, brandDark40: Color, textPrimary: Color, textSecondary: Color, textAccent: Color, background: Color, backgroundSecondary: Color, backgroundUpdateButton: Color, separator: Color, qfIcon: Color, externalLinkIcon: Color) {
        self.brand = brand
        self.brandLight20 = brandLight20
        self.brandLight40 = brandLight40
        self.brandDark40 = brandDark40
        self.textPrimary = textPrimary
        self.textSecondary = textSecondary
        self.textAccent = textAccent
        self.background = background
        self.backgroundSecondary = backgroundSecondary
        self.backgroundUpdateButton = backgroundUpdateButton
        self.separator = separator
        self.qfIcon = qfIcon
        self.externalLinkIcon = externalLinkIcon
    }

    public var brand: Color
    public var brandLight20: Color
    public var brandLight40: Color
    public var brandDark40: Color

    public var textPrimary: Color
    public var textSecondary: Color
    public var textAccent: Color

    public var background: Color
    public var backgroundSecondary: Color
    public var backgroundUpdateButton: Color
    public var separator: Color

    public var qfIcon: Color
    public var externalLinkIcon: Color

    /// Default color set for testing and previews
    public static let testColors = Colors(
        brand: Color(rgbValue: 0x6D4AFF),
        brandLight20: Color(rgbValue: 0x8A6EFF),
        brandLight40: Color(rgbValue: 0xC4B7FF),
        brandDark40: Color(rgbValue: 0x372580),
        textPrimary: Color.white,
        textSecondary: Color(rgbValue: 0xA7A4B5),
        textAccent: Color(rgbValue: 0x6C49FF),
        background: Color(rgbValue: 0x1C1B24),
        backgroundSecondary: Color(rgbValue: 0x292733),
        backgroundUpdateButton: Color(rgbValue: 0x303239),
        separator: Color(rgbValue: 0x303238),
        qfIcon: Color(rgbValue: 0xFAC530),
        externalLinkIcon: Color(rgbValue: 0x999592)
    )

}

@available(iOS 14.0, *)
struct ColorsEnvironmentKey: EnvironmentKey {
    static var defaultValue = Colors.testColors
}

@available(iOS 14.0, *)
extension EnvironmentValues {
    var colors: Colors {
        get { self[ColorsEnvironmentKey.self] }
        set { self[ColorsEnvironmentKey.self] = newValue }
    }
}

@available(iOS 14.0, *)
fileprivate extension Color {
    init(rgbValue: UInt) {
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0
        )
    }
}
