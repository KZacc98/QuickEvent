//
//  LocationRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 02/12/2024.
//


struct LocationRemote: Codable, Equatable {
    let longitude: String?
    let latitude: String?
    
    func toDomain() -> LocationDomain? {
        guard let longitude, let latitude else { return nil }
        return LocationDomain(longitude: Double(longitude), latitude: Double(latitude))
    }
}
