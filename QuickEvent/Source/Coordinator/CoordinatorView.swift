//
//  CoordinatorView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 27/11/2024.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(screen: .home)
                .navigationDestination(for: Screen.self) { screen in
                    coordinator.build(screen: screen)
                }
        }
        .environmentObject(coordinator)
    }
}
