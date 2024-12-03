//
//  EventDomain.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//

import Foundation

struct EventDomain: Identifiable, Equatable {
    static func == (lhs: EventDomain, rhs: EventDomain) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: String
    let name: String?
    let type: String?
    let url: String?
    let locale: String?
    let images: [EventImageDomain]
    let venueDetails: [VenueDomain]
    let attractions: [AttractionDomain]
    let dates: EventDatesDomain?
    let sales: SalesDomain?
    let classifications: [ClassificationDomain]
    let promoter: PromoterDomain?
    let promoters: [PromoterDomain]
    let priceRanges: [PriceRangeDomain]
    let seatmap: URL?
    
    var usableImages: [EventImageDomain]? {
        images.filter { $0.height > 200 }.sorted(by: { $0.height > $1.height })
    }
    
    var worstFourByThreeImage: EventImageDomain? {
        images.min(by: { $0.height < $1.height })
    }
    
    var bestFourByThreeImage: EventImageDomain? {
        images.filter { $0.ratio == .fourByThree }.max(by: { $0.height < $1.height })
    }
    
    var bestThreeByTwoImage: EventImageDomain? {
        images.filter { $0.ratio == .threeByTwo }.max(by: { $0.height < $1.height })
    }
    
    var bestSixteenByNineImage: EventImageDomain? {
        images.filter { $0.ratio == .sixteenByNine }.max(by: { $0.height < $1.height })
    }
}
