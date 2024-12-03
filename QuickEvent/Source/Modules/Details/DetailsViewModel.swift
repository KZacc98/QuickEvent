//
//  DetailsViewModel.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

import SwiftUI
import Combine

class DetailsViewModel: ObservableObject {
    @Published var event: EventDomain
    var factory: DetailsViewModelFactory
    
    let id = UUID()
    
    init(event: EventDomain, factory: DetailsViewModelFactory) {
        self.event = event
        self.factory = factory
    }
}
