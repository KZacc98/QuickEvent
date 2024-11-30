//
//  EventImageRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//


struct EventImageRemote: Codable {
    let ratio: String?
    let url: String?
    let width: Int
    let height: Int
    let fallback: Bool?

    func toDomain() -> EventImageDomain {
        return EventImageDomain(
            ratio: ImageRatio(rawValue: ratio ?? "") ?? .unknown,
            url: url,
            width: width,
            height: height,
            fallback: fallback
        )
    }
}