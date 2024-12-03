//
//  DetailsEventSeatMapView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 03/12/2024.
//

import SwiftUI

struct DetailsEventSeatMapView: View {
    let seatMapUrl: URL
    
    init(seatMapUrl: URL) {
        self.seatMapUrl = seatMapUrl
    }
    
    var body: some View {
        Link(destination: seatMapUrl) {
            BaseCardView(infoImage: nil, infoText: "Additional Information", showChevron: true) {
                AsyncImage(url: seatMapUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                } placeholder: {
                    ProgressView("Loading...")
                        .tint(Color("BabyPowder"))
                        .foregroundColor(Color("BabyPowder"))
                }
            }
        }
    }
}
