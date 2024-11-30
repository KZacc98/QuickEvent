//
//  TMResponseRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//


struct TMResponseRemote: Codable {
    let embedded: EmbeddedEventsRemote

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}