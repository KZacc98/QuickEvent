//
//  LocationDomain.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 02/12/2024.
//


struct LocationDomain: Equatable {
    let longitude: Double
    let latitude: Double
    
    init?(longitude: Double?, latitude: Double?) {
        guard let longitude, let latitude else { return nil }
        self.longitude = longitude
        self.latitude = latitude
    }
}
