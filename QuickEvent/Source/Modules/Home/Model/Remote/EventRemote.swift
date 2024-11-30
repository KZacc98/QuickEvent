//
//  EventRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//


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
    let dates: EventDatesRemote?
    

    enum CodingKeys: String, CodingKey {
        case id, name, type, url, locale, images, dates
        case venueDetails = "_embedded"
    }
    
    enum EmbeddedCodingKeys: String, CodingKey {
        case venues
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
            self.venueDetails = try embeddedContainer.decodeIfPresent([VenueRemote].self, forKey: .venues)
        } else {
            self.venueDetails = nil
        }
        
        self.dates = try? container.decodeIfPresent(EventDatesRemote.self, forKey: .dates)
    }
    

    func toDomain() -> EventDomain {
        return EventDomain(
            id: id,
            name: name,
            type: type,
            url: url,
            locale: locale,
            images: images?.map { $0.toDomain() },
            venueDetails: venueDetails?.compactMap { $0.toDomain() },
            startDate: dates?.start?.localDate
        )
    }
}