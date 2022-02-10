//
//  Created on 10.01.2022.
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
import UIKit

public protocol UpsellViewControllerDelegate: AnyObject {
    func userDidRequestPlus()
    func userDidDismissUpsell()
}

final public class UpsellViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet private weak var getPlusButton: UIButton!
    @IBOutlet private weak var useFreeButton: UIButton!
    @IBOutlet private weak var featuresStackView: UIStackView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var featuresFooterLabel: UILabel!

    // MARK: Properties

    weak public var delegate: UpsellViewControllerDelegate?
    var constants: UpsellConstantsProtocol!

    // MARK: Setup

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        baseViewStyle(view)
        actionButtonStyle(getPlusButton)
        actionTextButtonStyle(useFreeButton)
        titleStyle(titleLabel)
        footerStyle(featuresFooterLabel)

        getPlusButton.setTitle(LocalizedString.modalsGetPlus, for: .normal)
        useFreeButton.setTitle(LocalizedString.modalsUpsellStayFree, for: .normal)
        titleLabel.text = LocalizedString.modalsUpsellTitle(constants.numberOfServers, constants.numberOfCountries)
        featuresFooterLabel.text = LocalizedString.modalsUpsellFeaturesFooter

        useFreeButton.accessibilityIdentifier = "UseFreeButton"
        getPlusButton.accessibilityIdentifier = "GetPlusButton"
        titleLabel.accessibilityIdentifier = "TitleLabel"

        let closeButton = UIBarButtonItem(image: UIImage(named: "CloseButton", in: Bundle.module, compatibleWith: nil), style: .plain, target: self, action: #selector(closeTapped))
        closeButton.accessibilityIdentifier = "CloseButton"
        navigationItem.leftBarButtonItem = closeButton

        for view in featuresStackView.arrangedSubviews {
            view.removeFromSuperview()
            featuresStackView.removeArrangedSubview(view)
        }

        for feature in Feature.allCases {
            let view = Bundle.module.loadNibNamed("FeatureView", owner: self, options: nil)?.first as! FeatureView
            view.constants = constants
            view.feature = feature
            featuresStackView.addArrangedSubview(view)
        }
    }

    // MARK: Actions

    @IBAction private func getPlusTapped(_ sender: Any) {
        delegate?.userDidRequestPlus()
    }

    @IBAction private func useFreeTapped(_ sender: Any) {
        delegate?.userDidDismissUpsell()
    }

    @objc private func closeTapped() {
        delegate?.userDidDismissUpsell()
    }
}