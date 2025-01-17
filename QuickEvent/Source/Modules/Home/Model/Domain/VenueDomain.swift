//
//  VenueDomain.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//


struct VenueDomain: Identifiable, Equatable {
    let name: String?
    let type: String?
    let id: String?
    let test: Bool?
    let url: String?
    let locale: String?
    let location: LocationDomain?
    let postalCode: String?
    let timezone: String?
    let city: String?
    let state: String?
    let address: String?
    let country: String?
    
    var addressString: String {
        let components = [city, address, state, country]
        
        return components.compactMap { $0 }.joined(separator: ", ")
    }
}
