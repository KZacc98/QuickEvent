//
//  Coordinator.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 27/11/2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    func push(_screen: Screen) {
        path.append(_screen)
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
            HomeView()
        case .details(data: let data):
            DetailsView(data: data)
        }
    }
}
