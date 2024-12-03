//
//  DetailsView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 27/11/2024.
//

import SwiftUI
import MapKit

struct DetailsView: View {
    @StateObject var viewModel: DetailsViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    init(viewModel: DetailsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            DetailsBackgroundView(imageUrl: viewModel.event.worstFourByThreeImage?.url)
            ScrollView{
                VStack {
                    EventImagePagerView(images: viewModel.images)
                    
                    DetailsEventInfoView(
                        eventName: viewModel.event.name ?? "",
                        attractionName: viewModel.event.attractions.first?.name ?? "",
                        eventDate: viewModel.makeDateString(),
                        eventType: viewModel.event.classifications.first?.segment ?? ""
                    ).onTapGesture {
                        dump(viewModel.event.priceRanges)
                    }
                    
                    ForEach(viewModel.event.priceRanges, id: \.self) { priceRange in
                        DetailsTicketInfoView(pricing: priceRange)
                    }
                    
                    ForEach(viewModel.event.venueDetails) { venue in
                        EventLocationInfoView(venueName: venue.name ?? "", address: venue.addressString, venueLocation: venue.location)
                    }
                    
                    ForEach(viewModel.event.attractions, id: \.id) { attraction in
                        DetailsAttractionInfo(attraction: attraction)
                    }
                    
                    if let seatMapUrl = viewModel.event.seatmap {
                        DetailsEventSeatMapView(seatMapUrl: seatMapUrl)
                    }
                }
            }
        }
        
    }
}
