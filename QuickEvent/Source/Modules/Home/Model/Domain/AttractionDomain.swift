//
//  AttractionDomain.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

import Foundation

struct AttractionDomain {
    let id: String
    let name: String?
    let type: String?
    let url: URL?
    let externalLinks: ExternalLinksDomain?
    let images: [EventImageDomain]
    let classifications: [ClassificationDomain]
}
