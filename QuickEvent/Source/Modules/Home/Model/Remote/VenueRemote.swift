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
    let location: LocationRemote?
    let postalCode: String?
    let timezone: String?
    let city: String?
    let state: String?
    let address: String?
    let country: String?

    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, location, postalCode, timezone, city, address, country, state
    }
    
    enum AddressCodingKeys: String, CodingKey {
        case line1
    }
    
    enum StateCodingKeys: String, CodingKey {
        case name
    }
    
    enum CountryCodingKeys: String, CodingKey {
        case name
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decodeIfPresent(String.self, forKey: .name)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        test = try container.decodeIfPresent(Bool.self, forKey: .test)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        locale = try container.decodeIfPresent(String.self, forKey: .locale)
        location = try? container.decodeIfPresent(LocationRemote.self, forKey: .location)
        postalCode = try container.decodeIfPresent(String.self, forKey: .postalCode)
        timezone = try container.decodeIfPresent(String.self, forKey: .timezone)

        if let cityContainer = try? container.nestedContainer(keyedBy: CodingKeys.self, forKey: .city) {
            city = try cityContainer.decodeIfPresent(String.self, forKey: .name)
        } else {
            city = nil
        }

        if let stateContainer = try? container.nestedContainer(keyedBy: StateCodingKeys.self, forKey: .state) {
            state = try stateContainer.decodeIfPresent(String.self, forKey: .name)
        } else {
            state = nil
        }
        
        if let addressContainer = try? container.nestedContainer(keyedBy: AddressCodingKeys.self, forKey: .address) {
            address = try addressContainer.decodeIfPresent(String.self, forKey: .line1)
        } else {
            address = nil
        }
        
        if let countryContainer = try? container.nestedContainer(keyedBy: CountryCodingKeys.self, forKey: .country) {
            country = try countryContainer.decodeIfPresent(String.self, forKey: .name)
        } else {
            country = nil
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
            location: location?.toDomain(),
            postalCode: postalCode,
            timezone: timezone,
            city: city,
            state: state,
            address: address,
            country: country
        )
    }
}
