//
//  CreateNewProfileViewController.swift
//  ProtonVPN - Created on 27.06.19.
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

import Cocoa
import vpncore

final class CreateNewProfileViewController: NSViewController {
    
    @IBOutlet private weak var profileSettingsLabel: PVPNTextField!
    @IBOutlet private weak var nameLabel: PVPNTextField!
    @IBOutlet private weak var nameTextField: TextFieldWithFocus!
    @IBOutlet private weak var nameTextFieldHorizontalLine: NSBox!
    @IBOutlet private weak var colorPickerLabel: PVPNTextField!
    @IBOutlet private weak var colorPickerViewContainer: NSView!
    
    @IBOutlet private weak var connectionSettingsLabel: PVPNTextField!
    @IBOutlet private weak var typeLabel: PVPNTextField!
    @IBOutlet private weak var typeList: HoverDetectionPopUpButton!
    @IBOutlet private weak var typeListHorizontalLine: NSBox!
    @IBOutlet private weak var countryLabel: PVPNTextField!
    @IBOutlet private weak var countryList: HoverDetectionPopUpButton!
    @IBOutlet private weak var countryListHorizontalLine: NSBox!
    @IBOutlet private weak var serverLabel: PVPNTextField!
    @IBOutlet private weak var serverList: HoverDetectionPopUpButton!
    @IBOutlet private weak var serverListHorizontalLine: NSBox!
    @IBOutlet private weak var protocolLabel: PVPNTextField!
    @IBOutlet private weak var protocolList: HoverDetectionPopUpButton!
    @IBOutlet private weak var protocolListHorizontalLine: NSBox!
    @IBOutlet private weak var protocolEnablementProgress: NSProgressIndicator!

    @IBOutlet private weak var warningLabel: PVPNTextField!
    @IBOutlet private weak var warningLabelHorizontalLine: NSBox!
    @IBOutlet private weak var footerView: NSView!
    @IBOutlet private weak var saveButton: PrimaryActionButton!
    @IBOutlet private weak var cancelButton: CancellationButton!
    
    fileprivate var viewModel: CreateNewProfileViewModel!

    private var colorPickerViewController: ColorPickerViewController!
    
    private var isSessionUnderway: Bool {
        return !nameTextField.stringValue.isEmpty ||
            typeList.indexOfSelectedItem != 0 ||
            countryList.indexOfSelectedItem != 0
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported initializer")
    }
    
    required init(viewModel: CreateNewProfileViewModel) {
        super.init(nibName: NSNib.Name("CreateNewProfile"), bundle: nil)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupHeaderView()
        setupNameSection()
        setupColorSection()
        setupTypeSection()
        setupCountrySection()
        setupServerSection()
        setupProtocolSection()
        setupWarningSection()
        setupFooterView()

        startObserving()
    }
    
    override func viewWillDisappear() {
        super.viewWillDisappear()
        
        cancelButton.isHovered = false
        saveButton.isHovered = false
    }
    
    private func setupView() {
        view.wantsLayer = true
        view.layer?.backgroundColor = viewModel.cgColor(.background)
    }
    
    private func setupHeaderView() {
        profileSettingsLabel.attributedStringValue = viewModel.style(LocalizedString.profileSettings.uppercased(), context: .field, font: .themeFont(.small, bold: true), alignment: .left)
        connectionSettingsLabel.attributedStringValue = viewModel.style(LocalizedString.connectionSettings.uppercased(), context: .field, font: .themeFont(.small, bold: true), alignment: .left)
    }
    
    private func setupNameSection() {
        nameLabel.attributedStringValue = viewModel.style(LocalizedString.name + ":", font: .themeFont(.heading4), alignment: .left)

        nameTextField.style(placeholder: LocalizedString.name, font: .themeFont(.heading4), alignment: .left)
        nameTextField.drawsBackground = true
        nameTextField.focusRingType = .none
        nameTextField.delegate = self
        nameTextField.focusDelegate = self
        nameTextField.setAccessibilityIdentifier("NameTextField")
        
        nameTextFieldHorizontalLine.fillColor = viewModel.color(.border)
    }

    private func setupProtocolSection() {
        protocolLabel.attributedStringValue = viewModel.style(LocalizedString.vpnProtocol, font: .themeFont(.heading4), alignment: .left)

        protocolList.isBordered = false
        protocolList.target = self
        protocolList.action = #selector(protocolSelected)
        protocolList.push(items: viewModel.protocolMenuItems)

        protocolEnablementProgress.isDisplayedWhenStopped = false
        protocolEnablementProgress.appearance = NSAppearance(named: .darkAqua)
        protocolEnablementProgress.toolTip = LocalizedString.sysexSettingsDescription

        protocolListHorizontalLine.fillColor = viewModel.color(.border)
    }
    
    private func setupColorSection() {
        colorPickerLabel.attributedStringValue = viewModel.style(LocalizedString.color + ":", font: .themeFont(.heading4), alignment: .left)
        
        colorPickerViewController = ColorPickerViewController(viewModel: viewModel.colorPickerViewModel)
        colorPickerViewContainer.pin(viewController: colorPickerViewController)
    }
    
    private func setupTypeSection() {
        typeLabel.attributedStringValue = viewModel.style(LocalizedString.feature + ":", font: .themeFont(.heading4), alignment: .left)
        
        typeList.isBordered = false
        typeList.target = self
        typeList.action = #selector(typeSelected)
        typeList.setAccessibilityIdentifier("ServerTypeList")
        typeList.push(items: viewModel.serverTypeMenuItems)

        typeListHorizontalLine.fillColor = viewModel.color(.border)
    }
    
    private func setupCountrySection() {
        countryLabel.attributedStringValue = viewModel.style(LocalizedString.country + ":", font: .themeFont(.heading4), alignment: .left)
        
        countryList.isBordered = false
        countryList.target = self
        countryList.action = #selector(countrySelected)
        countryList.setAccessibilityIdentifier("CountryList")
        countryList.push(items: viewModel.countryMenuItems)

        countryListHorizontalLine.fillColor = viewModel.color(.border)
    }
    
    private func setupServerSection() {
        serverLabel.attributedStringValue = viewModel.style(LocalizedString.server + ":", font: .themeFont(.heading4), alignment: .left)
        
        serverList.isBordered = false
        serverList.target = self
        serverList.action = #selector(serverSelected)
        serverList.setAccessibilityIdentifier("ServerList")
        serverList.push(items: viewModel.serverMenuItems)

        serverListHorizontalLine.fillColor = viewModel.color(.border)
    }
        
    private func setupWarningSection() {
        warningLabel.isHidden = true
        
        warningLabelHorizontalLine.fillColor = .color(.border, .danger)
        warningLabelHorizontalLine.isHidden = true
        
        warningLabel.setAccessibilityIdentifier("ErrorMessage")
    }
    
    private func setupFooterView() {
        cancelButton.title = LocalizedString.cancel
        cancelButton.target = self
        cancelButton.action = #selector(cancelButtonAction)
        
        saveButton.title = LocalizedString.save
        saveButton.target = self
        saveButton.action = #selector(saveButtonAction)
        
        cancelButton.setAccessibilityIdentifier("CancelButton")
        saveButton.setAccessibilityIdentifier("SaveButton")
        
        footerView.wantsLayer = true
        footerView.layer?.backgroundColor = .cgColor(.background, .weak)
    }

    @objc private func typeSelected() {
        typeList.selectedViewModel?.handler()
    }

    @objc private func countrySelected() {
        countryList.selectedViewModel?.handler()
    }

    @objc private func serverSelected() {
        serverList.selectedViewModel?.handler()
    }

    @objc private func protocolSelected() {
        protocolList.selectedViewModel?.handler()
    }

    @objc private func tourCancelled() {
        viewModel.sysexTourCancelled?()
    }

    @objc private func cancelButtonAction() {
        if isSessionUnderway {
            let viewModel = WarningPopupViewModel(title: LocalizedString.createNewProfile,
                                                  description: LocalizedString.currentSelectionWillBeLost) { [weak self] in
                self?.viewModel.clearContent()
            }
            presentAsModalWindow(WarningPopupViewController(viewModel: viewModel))
            return
        }
        viewModel.clearContent()
    }
    
    @objc private func saveButtonAction() {
        viewModel.profileName = nameTextField.stringValue
        viewModel.save()
    }

    private func presentAlert(_ message: String) {
        warningLabel.attributedStringValue = message.styled(.danger, font: .themeFont(.heading4))
        warningLabel.isHidden = false
        warningLabelHorizontalLine.isHidden = false
    }
    
    private func startObserving() {
        viewModel.menuContentChanged = { [weak self] keyPaths in self?.menuContentChanged(keyPaths: keyPaths) }
        viewModel.prefillContent = { [weak self] in self?.prefillContent() }
        viewModel.contentWarning = { [weak self] message in self?.presentAlert(message) }
        viewModel.secureCoreWarning = { [weak self] in self?.secureCoreWarning() }
        viewModel.protocolPending = { [weak self] pending in
            if pending {
                self?.protocolEnablementProgress.startAnimation(nil)
            } else {
                self?.protocolEnablementProgress.stopAnimation(nil)
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(clearContent),
                                               name: viewModel.sessionFinished, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(tourCancelled),
                                               name: SystemExtensionManager.userCancelledTour, object: nil)
    }
    
    private func prefillContent() {
        clearContent()

        if let profileName = viewModel.profileName {
            nameTextField.stringValue = profileName
        }
    }

    private func menuContentChanged(keyPaths: CreateNewProfileViewModel.MenuContentUpdate) {
        for update in keyPaths {
            let list: HoverDetectionPopUpButton
            switch update {
            case \.serverTypeMenuItems:
                list = typeList
            case \.countryMenuItems:
                list = countryList
            case \.serverMenuItems:
                list = serverList
            case \.protocolMenuItems:
                list = protocolList
            default:
                assertionFailure("Unhandled content update with key path \(update)")
                continue
            }

            list.push(items: viewModel[keyPath: update])
        }
    }
    
    @objc private func clearContent() {
        nameTextField.stringValue = ""
        warningLabel.isHidden = true
        warningLabelHorizontalLine.isHidden = true
    }
    
    private func secureCoreWarning() {
        presentAsModalWindow(SecureCoreWarningViewController(viewModel: viewModel.secureCoreWarningViewModel))
    }
}

// MARK: - TextField highlight on focus
extension CreateNewProfileViewController: TextFieldFocusDelegate {
    var shouldBecomeFirstResponder: Bool { true }

    func willReceiveFocus(_ textField: NSTextField) {
        nameTextFieldHorizontalLine.fillColor = .color(.border, .interactive)
    }
}

// MARK: - TextField loss of highlight on loss of focus
extension CreateNewProfileViewController: NSTextFieldDelegate {
    func controlTextDidEndEditing(_ obj: Notification) {
        nameTextFieldHorizontalLine.fillColor = viewModel.color(.border)
    }
}
