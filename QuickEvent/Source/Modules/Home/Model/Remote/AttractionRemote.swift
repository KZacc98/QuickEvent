//
//  AttractionRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

import Foundation

struct AttractionRemote: Codable {
    let id: String
    let name: String?
    let type: String?
    let url: String?
    let externalLinks: ExternalLinksRemote?
    let images: [EventImageRemote]
    let classifications: [ClassificationRemote]

    enum CodingKeys: String, CodingKey {
        case id, name, type, url, externalLinks, images, classifications
    }
    
    func toDomain() -> AttractionDomain {
        AttractionDomain(
            id: id,
            name: name,
            type: type,
            url: URL(optionalString: url),
            externalLinks: externalLinks?.toDomain(),
            images: images.compactMap { $0.toDomain() },
            classifications: classifications.compactMap { $0.toDomain() }
        )
    }
}
