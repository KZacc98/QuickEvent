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
            ScrollView(content: {
                LazyVStack {
                    ForEach(viewModel.events) { event in
                        EventListItemView(item: EventListItem(
                            title: event.name ?? "title",
                            eventDate: event.dates?.start?.localDate?.formatted() ?? "desc1",
                            city: event.venueDetails.first?.city ?? "desc2",
                            venueName: event.venueDetails.first?.name ?? "desc3",
                            imageUrl: event.bestThreeByTwoImage?.url))
                        .padding(.vertical, 8)
                        .onTapGesture {
                            Task {
                                guard let eventDetails = await viewModel.getEvent(by: event.id) else { return }
                                coordinator.push(.details(viewModel: DetailsViewModel(event: eventDetails)))
                            }
                        }
                        .onAppear {
                            if viewModel.shouldLoadMoreEvents(currentItem: event) {
                                viewModel.getEvents()
                            }
                        }
                    }
                }
            })
            
        }
        .onAppear {
            if viewModel.events.isEmpty {
                viewModel.getEvents()
            }
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .navigationBarItems(trailing: Button(action: {
            print("Filtrowanko")
        }) {
            Image(systemName: "gear")
        })
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
