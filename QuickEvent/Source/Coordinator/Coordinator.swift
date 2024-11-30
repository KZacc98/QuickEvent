//
//  Coordinator.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 27/11/2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(screen: Screen) -> some View {
        switch screen {
        case .home:
            HomeView(viewModel: HomeViewModel(eventsService: EventsService(networkManager: NetworkManager())))
        case .details(viewModel: let viewModel):
            DetailsView(viewModel: viewModel)
                .navigationTitle("Event Details")
        }
    }
}
