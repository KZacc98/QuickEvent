//
//  PromoterRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//


struct PromoterRemote: Codable {
    let id: String?
    let name: String?
    let description: String?
    
    func toDomain() -> PromoterDomain {
        PromoterDomain(
            id: id,
            name: name,
            description: description
        )
    }
}