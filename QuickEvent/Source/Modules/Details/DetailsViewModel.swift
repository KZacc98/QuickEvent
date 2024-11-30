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
    var images: [URL] = []
    
    let id = UUID()
    
    init(event: EventDomain) {
        self.event = event
        images = event.images.compactMap { $0.url }
    }
}
