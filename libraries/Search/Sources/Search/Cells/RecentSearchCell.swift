//
//  Created on 02.03.2022.
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

import UIKit

final class RecentSearchCell: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: Bundle.module)
    }

    // MARK: Outlets

    @IBOutlet private weak var lineViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var lineView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: Properties

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    // MARK: Setup

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
        baseViewStyle(self)
        cellHeaderStyle(titleLabel)
        lineSeparatorStyle(lineView, lineViewHeightConstraint)
    }
}
