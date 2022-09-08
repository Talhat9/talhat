//
//  Created on 2022-09-08.
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

open class Container {
    public struct Config {
        public let appIdentifierPrefix: String
        public let appGroup: String

        public init(appIdentifierPrefix: String,
                    appGroup: String) {
            self.appIdentifierPrefix = appIdentifierPrefix
            self.appGroup = appGroup
        }
    }

    public let config: Config

    private lazy var storage = Storage()
    private lazy var propertiesManager: PropertiesManagerProtocol = PropertiesManager(storage: storage)

    public init(_ config: Config) {
        self.config = config
    }
}

extension Container: StorageFactory {
    public func makeStorage() -> Storage {
        storage
    }
}

extension Container: PropertiesManagerFactory {
    public func makePropertiesManager() -> PropertiesManagerProtocol {
        propertiesManager
    }
}
