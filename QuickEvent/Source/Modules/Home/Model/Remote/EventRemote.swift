//
//  EventRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//

import Foundation

struct EventRemote: Codable, Identifiable, Equatable {
    static func == (lhs: EventRemote, rhs: EventRemote) -> Bool {
        lhs.id == rhs.id
    }
    let id: String
    let name: String?
    let type: String?
    let url: String?
    let locale: String?
    let images: [EventImageRemote]?
    let venueDetails: [VenueRemote]?
    let attractions: [AttractionRemote]?
    let dates: EventDatesRemote?
    let sales: SalesRemote?
    let classifications: [ClassificationRemote]?
    let promoter: PromoterRemote?
    let promoters: [PromoterRemote]?
    let priceRanges: [PriceRangeRemote]?
    let seatmap: String?
    

    enum CodingKeys: String, CodingKey {
        case id, name, type, url, locale, images, dates, sales, classifications, promoter, promoters, priceRanges, seatmap
        case venueDetails = "_embedded"
    }
    
    enum EmbeddedCodingKeys: String, CodingKey {
        case venues
        case attractions
    }
    
    enum SeatmapCodingKeys: String, CodingKey {
        case staticUrl
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.locale = try container.decodeIfPresent(String.self, forKey: .locale)
        self.images = try container.decodeIfPresent([EventImageRemote].self, forKey: .images)
        
        if let embeddedContainer = try? container.nestedContainer(keyedBy: EmbeddedCodingKeys.self, forKey: .venueDetails) {
            self.venueDetails = try? embeddedContainer.decodeIfPresent([VenueRemote].self, forKey: .venues)
            self.attractions = try? embeddedContainer.decodeIfPresent([AttractionRemote].self, forKey: .attractions)
        } else {
            self.venueDetails = nil
            self.attractions = nil
        }
        
        self.dates = try? container.decodeIfPresent(EventDatesRemote.self, forKey: .dates)
        self.sales = try? container.decodeIfPresent(SalesRemote.self, forKey: .sales)
        self.classifications = try? container.decodeIfPresent([ClassificationRemote].self, forKey: .classifications)
        self.promoter = try? container.decodeIfPresent(PromoterRemote.self, forKey: .promoter)
        self.promoters = try? container.decodeIfPresent([PromoterRemote].self, forKey: .promoters)
        self.priceRanges = try? container.decodeIfPresent([PriceRangeRemote].self, forKey: .priceRanges)
        
        if let seatmapContainer = try? container.nestedContainer(keyedBy: SeatmapCodingKeys.self, forKey: .seatmap) {
            self.seatmap = try seatmapContainer.decodeIfPresent(String.self, forKey: .staticUrl)
        } else {
            self.seatmap = nil
        }
    }
    

    func toDomain() -> EventDomain {
        return EventDomain(
            id: id,
            name: name,
            type: type,
            url: url,
            locale: locale,
            images: images?.compactMap { $0.toDomain() } ?? [],
            venueDetails: venueDetails?.compactMap { $0.toDomain() } ?? [],
            attractions: attractions?.compactMap { $0.toDomain() } ?? [],
            dates: dates?.toDomain(),
            sales: sales?.toDomain(),
            classifications: classifications?.compactMap { $0.toDomain() } ?? [],
            promoter: promoter?.toDomain(),
            promoters: promoters?.compactMap { $0.toDomain() } ?? [],
            priceRanges: priceRanges?.compactMap { $0.toDomain() } ?? [],
            seatmap: URL(optionalString: seatmap)
        )
    }
}


