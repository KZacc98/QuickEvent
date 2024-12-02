//
//  EventDatesDomain.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 02/12/2024.
//

import Foundation

struct EventDatesDomain {
    let start: StartDateDomain?
    let timezone: String?
    let spanMultipleDays: Bool
    
    var startDateTBA: Bool {
        guard let dateTBA = start?.dateTBA else { return false }
        
        return dateTBA
    }
    
    var formattedDateTime: String {
        guard let startDateTime = start?.dateTime else { return "" }
        
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "HH:mm, dd.MM.yyyy"
        return dateFormatter.string(from: startDateTime)
    }
}
