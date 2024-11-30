//
//  PriceRangeRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

struct PriceRangeRemote: Codable {
    let type: String?
    let currency: String?
    let min: Double?
    let max: Double?
    
    func toDomain() -> PriceRangeDomain {
        PriceRangeDomain(
            type: type,
            currency: currency,
            min: min,
            max: max
        )
    }
}
