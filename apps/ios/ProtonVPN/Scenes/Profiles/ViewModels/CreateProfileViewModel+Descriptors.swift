//
//  CreateNewProfileViewModel+Descriptors.swift
//  ProtonVPN - Created on 01.07.19.
//
//  Copyright (c) 2019 Proton Technologies AG
//
//  This file is part of ProtonVPN.
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
//

import Foundation
import vpncore
import UIKit
import ProtonCore_UIFoundations

extension CreateOrEditProfileViewModel {
    private var fontSize: CGFloat {
        return 17
    }
    private var baselineOffset: CGFloat {
        return 4
    }

    internal func countryDescriptor(for country: CountryModel) -> NSAttributedString {
        let imageAttributedString = embededImageIcon(image: UIImage.flag(countryCode: country.countryCode))
        let countryString = ("  " + country.country)
        let nameAttributedString: NSAttributedString
        if country.lowestTier <= userTier {
            nameAttributedString = NSMutableAttributedString(
                string: countryString,
                attributes: [
                    .font: UIFont.systemFont(ofSize: fontSize),
                    .baselineOffset: baselineOffset,
                    .foregroundColor: UIColor.normalTextColor()
                ]
            )
        } else {
            nameAttributedString = NSMutableAttributedString(
                string: countryString + " (\(LocalizedString.upgradeRequired))",
                attributes: [
                    .font: UIFont.systemFont(ofSize: fontSize),
                    .baselineOffset: baselineOffset,
                    .foregroundColor: UIColor.weakTextColor()
                ]
            )
        }
        return NSAttributedString.concatenate(imageAttributedString, nameAttributedString)
    }
    
    internal func serverDescriptor(for server: ServerModel) -> NSAttributedString {
        if server.isSecureCore {
            let via = NSMutableAttributedString(
                string: "\(LocalizedString.via)  ",
                attributes: [
                    .font: UIFont.systemFont(ofSize: fontSize),
                    .baselineOffset: baselineOffset,
                    .foregroundColor: UIColor.normalTextColor()
                ]
            )
            let entryCountryFlag = embededImageIcon(image: UIImage.flag(countryCode: server.entryCountryCode))
            let entryCountry = NSMutableAttributedString(
                string: "  " + server.entryCountry,
                attributes: [
                    .font: UIFont.systemFont(ofSize: fontSize),
                    .baselineOffset: baselineOffset,
                    .foregroundColor: UIColor.normalTextColor()
                ]
            )
            return NSAttributedString.concatenate(via, entryCountryFlag, entryCountry)
        } else {
            let countryFlag = embededImageIcon(image: UIImage.flag(countryCode: server.countryCode))
            let serverString = "  " + server.name
            let serverDescriptor: NSAttributedString
            if server.tier <= userTier {
                serverDescriptor = NSMutableAttributedString(
                    string: serverString,
                    attributes: [
                        .font: UIFont.systemFont(ofSize: fontSize),
                        .baselineOffset: baselineOffset,
                        .foregroundColor: UIColor.normalTextColor()
                    ]
                )
            } else {
                serverDescriptor = NSMutableAttributedString(
                    string: serverString + " (\(LocalizedString.upgradeRequired))",
                    attributes: [
                        .font: UIFont.systemFont(ofSize: fontSize),
                        .baselineOffset: baselineOffset,
                        .foregroundColor: UIColor.weakTextColor()
                    ]
                )
            }
            return NSAttributedString.concatenate(countryFlag, serverDescriptor)
        }
    }
    
    internal func defaultServerDescriptor(forIndex index: Int) -> NSAttributedString {
        let image: UIImage
        let name: String
        
        switch index {
        case 0:
            image = IconProvider.bolt
            name = LocalizedString.fastest
        default:
            image = IconProvider.arrowsSwapRight
            name = LocalizedString.random
        }

        let imageAttributedString = NSMutableAttributedString(attributedString: NSAttributedString.imageAttachment(image: image, size: CGSize(width: 24, height: 24)))
        let nameAttributedString = NSMutableAttributedString(
            string: "  " + name,
            attributes: [
                .font: UIFont.systemFont(ofSize: fontSize),
                .baselineOffset: baselineOffset
            ]
        )
        nameAttributedString.insert(imageAttributedString, at: 0)

        return nameAttributedString
    }
    
    private func embededImageIcon(image: UIImage?) -> NSAttributedString {
        if let image = image {
            return NSAttributedString.imageAttachment(image: image, size: CGSize(width: 18, height: 18))
        }
        return NSAttributedString(string: "")
    }
}
