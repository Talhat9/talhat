//
//  Created on 2022-01-13.
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

import XCTest
@testable import BugReport

final class FormViewModelTests: XCTestCase {
    
    private let emailValue = "elon@tesla.com"
    private let usernameValue = "elon"
    
    func testAddsEmailAndLogs() throws {
        let inputData = [
            InputField.init(label: "1", submitLabel: "", type: .textSingleLine, isMandatory: nil, placeholder: nil),
            InputField.init(label: "2", submitLabel: "", type: .textMultiLine, isMandatory: nil, placeholder: nil),
            InputField.init(label: "3", submitLabel: "", type: .switch, isMandatory: nil, placeholder: nil),
        ]
        let vm = FormViewModel(fields: inputData, category: "Connection issues")
        
        XCTAssertEqual(vm.fields.count, inputData.count + 4)
        XCTAssertEqual(vm.fields.first?.inputField.submitLabel, "_email")
        XCTAssertEqual(vm.fields.last?.inputField.submitLabel, "_logs")
        XCTAssertEqual(vm.fields[2].inputField.submitLabel, "Category")
        XCTAssertEqual(vm.fields[2].stringValue, "Connection issues")
    }
    
    func testEmailIsAddedToResult() {
        let expectation = XCTestExpectation(description: "Email field is present")
        
        let delegate = MockBugReportDelegate(model: .mock)
        delegate.sendCallback = { form, _ in
            if form.email == self.emailValue {
                expectation.fulfill()
            }
        }
        CurrentEnv.bugReportDelegate = delegate
        let vm = FormViewModel(fields: [
            InputField.init(label: "1", submitLabel: "", type: .textSingleLine, isMandatory: false, placeholder: nil),
            InputField.init(label: "1", submitLabel: "", type: .switch, isMandatory: false, placeholder: nil),
        ], category: "Connection issues")
        vm.fields[0].stringValue = emailValue
        vm.sendTapped()
        
        wait(for: [expectation], timeout: 2)
    }

    func testUsernameIsAddedToResult() {
        let expectation = XCTestExpectation(description: "Username field is present")

        let delegate = MockBugReportDelegate(model: .mock)
        delegate.sendCallback = { form, _ in
            if form.username == self.usernameValue {
                expectation.fulfill()
            }
        }
        CurrentEnv.bugReportDelegate = delegate
        let vm = FormViewModel(fields: [
            InputField.init(label: "1", submitLabel: "", type: .textSingleLine, isMandatory: false, placeholder: nil),
            InputField.init(label: "1", submitLabel: "", type: .switch, isMandatory: false, placeholder: nil),
        ], category: "Connection issues")
        vm.fields[0].stringValue = emailValue
        vm.fields[1].stringValue = usernameValue
        vm.sendTapped()

        wait(for: [expectation], timeout: 2)
    }
    
    func testResultIsNotSentWithoutMandatoryFields() {
        let expectationNotSent = XCTestExpectation(description: "Form data should not be send before user fills in all mandatory fields")
        expectationNotSent.isInverted = true
        
        let delegate = MockBugReportDelegate(model: .mock)
        delegate.sendCallback = { _, _ in
            expectationNotSent.fulfill()
        }
        CurrentEnv.bugReportDelegate = delegate
        
        let vm = FormViewModel(fields: [
            InputField.init(label: "1", submitLabel: "", type: .textSingleLine, isMandatory: true, placeholder: nil),
            InputField.init(label: "1", submitLabel: "", type: .switch, isMandatory: true, placeholder: nil),
        ], category: "Connection issues")
        vm.fields[0].stringValue = emailValue
        
        XCTAssertFalse(vm.canBeSent)
        vm.sendTapped()
        
        wait(for: [expectationNotSent], timeout: 1)        
    }
    
    func testMissingMandatoryFlagMeansFieldIsMandatory() {
        let vm = FormViewModel(fields: [InputField.init(label: "1", submitLabel: "", type: .textSingleLine, isMandatory: nil, placeholder: nil)], category: "Connection issues")
        vm.fields[0].stringValue = emailValue
        
        XCTAssertFalse(vm.canBeSent)
        vm.fields[3].stringValue = "value"
        XCTAssertTrue(vm.canBeSent)
    }
    
    func testErrorIsShownOnRequestError() {
        let delegate = MockBugReportDelegate(model: .mock)
        delegate.sendCallback = { _, callback in
            callback(.failure(NSError(domain: "test-error", code: 789, userInfo: nil)))
        }
        CurrentEnv.bugReportDelegate = delegate
        
        let vm = FormViewModel(fields: [InputField.init(label: "1", submitLabel: "", type: .textSingleLine, isMandatory: false, placeholder: nil)], category: "Connection issues")
        vm.fields[0].stringValue = emailValue
        
        XCTAssertNil(vm.sendResultError)
        vm.sendTapped()
        XCTAssertNotNil(vm.sendResultError)
    }
    
    func testForwardsUserActionsToDelegate() {
        let expectationSend = XCTestExpectation(description: "Data sent")
        let expectationTroubleshooting = XCTestExpectation(description: "Troubleshooting is open")
        let expectationFinish = XCTestExpectation(description: "Process is finished")
        
        let delegate = MockBugReportDelegate(model: .mock)
        delegate.sendCallback = { _, callback in
            expectationSend.fulfill()
        }
        delegate.troubleshootingCallback = {
            expectationTroubleshooting.fulfill()
        }
        delegate.finishedCallback = {
            expectationFinish.fulfill()
        }
        CurrentEnv.bugReportDelegate = delegate
        
        let vm = FormViewModel(fields: [InputField.init(label: "1", submitLabel: "", type: .textSingleLine, isMandatory: false, placeholder: nil)], category: "Connection issues")
        vm.fields[0].stringValue = emailValue
        vm.sendTapped()
        vm.troubleshootingTapped()
        vm.finished()
        
        wait(for: [expectationSend, expectationTroubleshooting, expectationFinish], timeout: 1)
    }
        
    func testShowsResultViewAfterSendingData() {
        let delegate = MockBugReportDelegate(model: .mock)
        delegate.sendCallback = { _, callback in
            callback(.success(Void()))
        }
        CurrentEnv.bugReportDelegate = delegate
        
        let vm = FormViewModel(fields: [InputField.init(label: "1", submitLabel: "", type: .textSingleLine, isMandatory: false, placeholder: nil)], category: "Connection issues")
        vm.fields[0].stringValue = emailValue
        
        XCTAssertFalse(vm.shouldShowResultView)
        vm.sendTapped()
        XCTAssertTrue(vm.shouldShowResultView)
        
    }
}
