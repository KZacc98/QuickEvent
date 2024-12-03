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
        images = event.usableImages?.compactMap { $0.url } ?? []
    }
    
    func makeDateString() -> String? {
        guard let dates = event.dates?.start else {
            return nil
        }
        
        if let dateTime = dates.dateTime {
            return dateTime.timeAndDateAsString()
        }
        
        if dates.timeTBA {
            return "Time TBA, \(dates.localDate?.dateAsString() ?? "")"
        }
        
        if dates.noSpecificTime {
            return nil
        }
        
        if dates.dateTBD {
            return "Date TBD"
        }
        
        if dates.dateTBA {
            return "Date TBA"
        }
        
        return nil
    }
}
