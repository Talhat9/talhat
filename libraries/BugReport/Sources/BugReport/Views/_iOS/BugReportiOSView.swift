//
//  Created on 2021-12-20.
//
//  Copyright (c) 2021 Proton AG
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

import SwiftUI
#if os(iOS)

/// First step of Bug Report flow.
/// Asks user to define problem category.
public struct BugReportiOSView: View {

    private weak var delegate: BugReportDelegate? = CurrentEnv.bugReportDelegate
    @StateObject var updateViewModel: IOSUpdateViewModel = CurrentEnv.iOSUpdateViewModel
    @Environment(\.colors) var colors: Colors

    public var body: some View {
        NavigationView {
            ZStack {
                colors.background.ignoresSafeArea()

                VStack(alignment: .leading, spacing: 0) {

                    UpdateAvailableView(isActive: $updateViewModel.updateIsAvailable)

                    StepProgress(step: 1, steps: 3, colorMain: colors.interactive, colorText: colors.textAccent, colorSecondary: colors.interactiveActive)
                        .padding(.bottom)

                    Text(LocalizedString.br1Title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(colors.textPrimary)
                        .padding(.horizontal)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0))

                    List(delegate?.model.categories ?? []) { category in
                        if category.suggestions?.isEmpty ?? true { // If no suggestions found skip directly to the form
                            NavigationLink(destination: {
                                FormiOSView(viewModel: FormViewModel(fields: category.inputFields, category: category.label))
                                    .navigationTitle(Text(LocalizedString.brWindowTitle))
                            }, label: { Text(category.label) })
                            .listRowBackground(colors.background)
                        } else {
                            NavigationLink(destination: {
                                QuickFixesiOSList(category: category)
                                    .navigationTitle(Text(LocalizedString.brWindowTitle))
                            }, label: { Text(category.label) })
                            .listRowBackground(colors.background)
                        }
                    }
                    .listStyle(.plain)
                    .foregroundColor(colors.textPrimary)
                }
                .navigationTitle(Text(LocalizedString.brWindowTitle))
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .navigationViewStyle(.stack)
        .preferredColorScheme(.dark)
    }

}

// MARK: - Preview

struct BugReportView_Previews: PreviewProvider {
    private static let bugReport = MockBugReportDelegate(model: .mock)

    static var previews: some View {
        CurrentEnv.bugReportDelegate = bugReport
        CurrentEnv.iOSUpdateViewModel.updateIsAvailable = true
        return Group {
            BugReportiOSView()
        }
    }
}

#endif
