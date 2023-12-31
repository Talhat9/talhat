//
//  Created on 19/04/2023.
//
//  Copyright (c) 2023 Proton AG
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

import Theme
import SwiftUI

public extension AppTheme {
    enum Typography {
        case hero
        case headline
        case subHeadline
        case body1(Weight = .regular)
        case body2(emphasised: Bool = false)
        case body3(emphasised: Bool = false)
        case caption(emphasised: Bool = false)
        case overline(emphasised: Bool = false)

        public enum Weight {
            case regular
            case semibold
            case bold

            var rawValue: Font.Weight {
                switch self {
                case .regular:
                    return .regular
                case .semibold:
                    return .semibold
                case .bold:
                    return .bold
                }
            }
        }
    }
}

public extension Text {
    func themeFont(_ typography: AppTheme.Typography = .body3()) -> Text {
        return self.font(.themeFont(typography))
    }
}
extension View {
    @inlinable public func font(_ typography: AppTheme.Typography = .body3()) -> some View {
        return self.font(.themeFont(typography))
    }
}

public extension Font {
    static func themeFont(_ typography: AppTheme.Typography = .body3()) -> Font {
        switch typography {
        case .hero:
            return .system(size: 28, weight: .bold)
        case .headline:
            return .system(size: 22, weight: .bold)
        case .subHeadline:
            return .system(size: 22, weight: .regular)
        case .body1(let weight):
            return .system(size: 17, weight: weight.rawValue)
        case .body2(let emphasised):
            return .system(size: 15, weight: emphasised ? .semibold : .regular)
        case .body3(let emphasised):
            return .system(size: 14, weight: emphasised ? .semibold : .regular)
        case .caption(let emphasised):
            return .system(size: 13, weight: emphasised ? .semibold : .regular)
        case .overline(let emphasised):
            return .system(size: 11, weight: emphasised ? .semibold : .regular)
        }
    }
}
