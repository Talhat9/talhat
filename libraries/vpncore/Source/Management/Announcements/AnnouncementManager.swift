//
//  AnnouncementManager.swift
//  vpncore - Created on 2020-10-09.
//
//  Copyright (c) 2019 Proton Technologies AG
//
//  This file is part of vpncore.
//
//  vpncore is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  vpncore is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with vpncore.  If not, see <https://www.gnu.org/licenses/>.
//

import Foundation

public protocol AnnouncementManager {
    var hasUnreadAnnouncements: Bool { get }
    func fetchCurrentAnnouncementsFromStorage() -> [Announcement]
    func markAsRead(announcement: Announcement)
    func shouldShowAnnouncementsIcon() -> Bool
}

public protocol AnnouncementManagerFactory {
    func makeAnnouncementManager() -> AnnouncementManager
}

/// Fetches announcements from storage.
/// Informs if there are any unread current announcements.
/// Marks announcements as read.
public class AnnouncementManagerImplementation: AnnouncementManager {
    
    public typealias Factory = AnnouncementStorageFactory
    private let factory: Factory
    
    private lazy var announcementStorage: AnnouncementStorage = factory.makeAnnouncementStorage()
    
    public init(factory: Factory) {
        self.factory = factory
    }

    public func shouldShowAnnouncementsIcon() -> Bool {
        fetchCurrentAnnouncementsFromStorage().contains(where: { $0.type == .default })
    }
    
    public func fetchCurrentAnnouncementsFromStorage() -> [Announcement] {
        announcementStorage.fetch().filter {
            $0.startTime.isPast && $0.endTime.isFuture && $0.offer != nil
        }
    }

    public var hasUnreadAnnouncements: Bool {
        return fetchCurrentAnnouncementsFromStorage().contains(where: { !$0.wasRead && $0.type == .default })
    }
    
    public func markAsRead(announcement: Announcement) {
        var announcements = announcementStorage.fetch()
        if let index = announcements.firstIndex(where: { $0.notificationID == announcement.notificationID }) {
            announcements[index].isRead = true
        }
        announcementStorage.store(announcements)
    }
    
}
