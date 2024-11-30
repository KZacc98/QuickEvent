//
//  ContentView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 27/11/2024.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @EnvironmentObject var coordinator: Coordinator

    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            List(viewModel.events) { event in
                EventListItemView(item: EventListItem(
                    title: event.name ?? "title",
                    eventDate: event.startDate ?? "desc1",
                    city: event.venueDetails?.first?.city ?? "desc2",
                    venueName: event.venueDetails?.first?.name ?? "desc3",
                    imageUrl: event.bestSixteenByNineImage?.url ?? ""))
                .padding(.vertical, 8)
                .onTapGesture {
                    coordinator.push(.details(data: [
                        event.name ?? "name",
                        event.startDate ?? "start",
                        event.venueDetails?.first?.name ?? "venue name"]))
                }
                .onAppear {
                    if event == viewModel.events.last {
                        viewModel.getEvents()
                    }
                }
            }
            .ignoresSafeArea(.all)
        }
        .onAppear {
            if viewModel.events.isEmpty {
                viewModel.getEvents()
            }
        }
    }
}

//#Preview {
//    HomeView(
//        viewModel: HomeViewModel(
//            eventsService: nil,
//            events: []
//        )
//    )
//}
