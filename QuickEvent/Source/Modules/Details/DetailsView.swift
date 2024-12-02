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
                    TabView {
                        ForEach(viewModel.event.images) { image in
                            AsyncImage(url: image.url) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ZStack {
                                    ProgressView()
                                }
                            }
                        }
                    }
                    .tabViewStyle(.page)
                    .frame(maxWidth: .infinity, minHeight: 200)
                    
                    DetailsEventInfo(
                        eventName: viewModel.event.name ?? "event name",
                        attractionName: viewModel.event.attractions.first?.name ?? "attractionName",
                        eventDates: viewModel.event.dates?.start
                    )
                    
                    ForEach(viewModel.event.venueDetails) { venue in
                        
                        EventLocationInfoView(venueName: venue.name ?? "", address: venue.addressString, venueLocation: venue.location)
                    }
                }
            }
        }
        
    }
}
