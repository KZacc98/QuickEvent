//
//  ContentView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 27/11/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onTapGesture {
            coordinator.push(_screen: .details(data: ["1", "2", "3"]))
        }
    }
}

#Preview {
    HomeView()
}
