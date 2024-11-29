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
                Text(event.name)
                    .font(.headline)
                    .padding()
                    .onAppear {
                        if event == viewModel.events.last {
                            viewModel.getEvents()
                        }
                    }
                    .onTapGesture {
                        coordinator.push(.details(data: [event.name]))
                    }
            }
        }
        .onAppear {
            if viewModel.events.isEmpty {
                viewModel.getEvents()
            }
        }
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            eventsService: nil,
            events: [
                Event(
                    id: "1",
                    name: "name"),
                Event(
                    id: "2",
                    name: "name")]
        )
    )
}
