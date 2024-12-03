//
//  DetailsTicketInfoView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 02/12/2024.
//

import SwiftUI

struct DetailsTicketInfoView: View {
    private let pricing: PriceRangeDomain
    
    init(pricing: PriceRangeDomain) {
        self.pricing = pricing
    }
    
    var body: some View {
        BaseCardView(infoImage: Image(systemName: "ticket.fill"), infoText: pricing.type?.capitalizeFirstLetter() ?? "") {
            HStack {
                if let minPrice = pricing.min {
                    Spacer()
                    VStack {
                        Text("Lowest Price")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(Color.babyPowder)
                        Text(minPrice.toCurrencyString(currencyCode: pricing.currency) ?? "")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.babyPowder)
                    }
                    Spacer()
                }
                
                if let maxPrice = pricing.max {
                    VStack {
                        Text("Highest Price")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(Color.babyPowder)
                        Text(maxPrice.toCurrencyString(currencyCode: pricing.currency) ?? "")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.babyPowder)
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    DetailsTicketInfoView(pricing: PriceRangeDomain(type: "standard", currency: "PLN", min: 199.99, max: 29000.98))
}
