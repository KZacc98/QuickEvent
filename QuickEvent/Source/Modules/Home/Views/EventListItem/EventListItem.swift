//
//  EventListItem.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

import Foundation

struct EventListItem: Identifiable {
    let id = UUID()
    let title: String?
    let eventDate: String?
    let city: String?
    let venueName: String?
    let imageUrl: URL?
}
