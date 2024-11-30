//
//  EventDomain.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//


struct EventDomain: Identifiable, Equatable {
    let id: String
    let name: String?
    let type: String?
    let url: String?
    let locale: String?
    let images: [EventImageDomain]?
    let venueDetails: [VenueDomain]?
    let startDate: String?
    
    var bestFourByThreeImage: EventImageDomain? {
        images?.filter { $0.ratio == .fourByThree }.max(by: { $0.height < $1.height })
    }
    
    var bestThreeByTwoImage: EventImageDomain? {
        images?.filter { $0.ratio == .threeByTwo }.max(by: { $0.height < $1.height })
    }
    
    var bestSixteenByNineImage: EventImageDomain? {
        images?.filter { $0.ratio == .sixteenByNine }.max(by: { $0.height < $1.height })
    }
}
