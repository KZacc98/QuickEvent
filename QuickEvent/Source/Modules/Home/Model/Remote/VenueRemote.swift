//
//  VenueRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//


struct VenueRemote: Codable, Equatable {
    let name: String?
    let type: String?
    let id: String?
    let test: Bool?
    let url: String?
    let locale: String?
    let postalCode: String?
    let timezone: String?
    let city: String?
    let state: String?
    let address: String?

    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, postalCode, timezone, city, address
    }
    
    enum AddressCodingKeys: String, CodingKey {
        case line1
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decodeIfPresent(String.self, forKey: .name)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        test = try container.decodeIfPresent(Bool.self, forKey: .test)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        locale = try container.decodeIfPresent(String.self, forKey: .locale)
        postalCode = try container.decodeIfPresent(String.self, forKey: .postalCode)
        timezone = try container.decodeIfPresent(String.self, forKey: .timezone)

        if let cityContainer = try? container.nestedContainer(keyedBy: CodingKeys.self, forKey: .city) {
            city = try cityContainer.decodeIfPresent(String.self, forKey: .name)
        } else {
            city = nil
        }

        if let stateContainer = try? container.nestedContainer(keyedBy: CodingKeys.self, forKey: .city) {
            state = try stateContainer.decodeIfPresent(String.self, forKey: .name)
        } else {
            state = nil
        }
        
        if let addressContainer = try? container.nestedContainer(keyedBy: AddressCodingKeys.self, forKey: .address) {
            address = try addressContainer.decodeIfPresent(String.self, forKey: .line1)
        } else {
            address = nil
        }
    }
    
    func toDomain() -> VenueDomain {
        return VenueDomain(
            name: name,
            type: type,
            id: id,
            test: test,
            url: url,
            locale: locale,
            postalCode: postalCode,
            timezone: timezone,
            city: city,
            state: state,
            address: address)
    }
}