//
//  TMResponse.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//

struct TMResponse: Codable {
    let embedded: Embedded

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}
