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
    
    @State private var showError = true
    @State private var presentFilterSheet = false
    @State private var eventDateOrder: FilterType = .recommended
    
    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            ScrollView(content: {
                LazyVStack {
                    ForEach(viewModel.events) { event in
                        EventListItemView(item: EventListItem(
                            title: event.name ?? "title",
                            eventDate: event.dates?.start?.localDate?.dateAsString() ?? "desc1",
                            city: event.venueDetails.first?.city ?? "desc2",
                            venueName: event.venueDetails.first?.name ?? "desc3",
                            imageUrl: event.bestThreeByTwoImage?.url))
                        .padding(.vertical, 8)
                        .onTapGesture {
                            Task {
                                guard let eventDetails = await viewModel.getEvent(by: event.id) else { return }
                                coordinator.push(.details(viewModel: DetailsViewModel(event: eventDetails, factory: DetailsViewModelFactory())))
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
            if let errorMessage = viewModel.errorMessage, showError {
                VStack {
                    Spacer()
                    Text(errorMessage)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(15, corners: [.topLeft, .topRight])
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.5)) {
                                showError = true
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                withAnimation(.easeOut(duration: 0.5)) {
                                    showError = false
                                }
                            }
                        }
                }
            }
            
            if viewModel.isLoading {
                withAnimation(.easeInOut(duration: 0.5)) {
                    ZStack {
                        Rectangle()
                            .background(.thinMaterial)
                            .frame(width: 50, height: 50)
                            .cornerRadius(15, corners: .allCorners)
                        
                        ProgressView()
                            .scaleEffect(2.0)
                            .tint(Color.babyPowder)
                            .frame(width: 50, height: 50)
                    }
                }
            }
        }
        .sheet(isPresented: $presentFilterSheet, content: {
            FilterView(eventDateOrder: $eventDateOrder)
                .presentationDragIndicator(.visible)
                .presentationDetents([.height(150)])
        })
        .onChange(of: eventDateOrder) { eventDateOrder in
            viewModel.refreshEvents(eventDateOrder: eventDateOrder)
        }
        .navigationBarItems(trailing: Button(action: {
            presentFilterSheet.toggle()
        }) {
            Image(systemName: "gear")
        })
    }
}
