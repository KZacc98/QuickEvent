//
//  SalesRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

import Foundation

struct SalesRemote: Codable {
    let publicSales: PublicSalesRemote?
    let presales: [PresalesRemote]?
    
    enum CodingKeys: String, CodingKey {
        case publicSales = "public"
        case presales
    }
    
    func toDomain() -> SalesDomain {
        return SalesDomain(
            publicSales: PublicSalesDomain(
                startDateTime: publicSales?.startDateTime?.toDateTime(),
                endDateTime: publicSales?.endDateTime?.toDateTime(),
                startTBD: publicSales?.startTBD),
            presales: presales?.compactMap {
                PresalesDomain(
                name: $0.name,
                description: $0.description,
                url: URL(optionalString: $0.url),
                startDateTime: $0.startDateTime?.toDateTime(),
                endDateTime: $0.endDateTime?.toDateTime())
            })
    }
}
