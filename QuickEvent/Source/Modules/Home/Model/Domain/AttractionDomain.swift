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
    
    var bestThreeByTwoImage: EventImageDomain? {
        images.filter { $0.ratio == .threeByTwo }.max(by: { $0.height < $1.height })
    }
}
