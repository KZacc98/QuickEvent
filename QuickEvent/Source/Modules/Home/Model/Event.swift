//
//  Event.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//

struct Event: Codable, Identifiable, Equatable {
    let id: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
