//
//  DetailsViewModelFactory.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 03/12/2024.
//

import Foundation

struct DetailsViewModelFactory {
    func makeDateString(dates: StartDateDomain?) -> String? {
        guard let dates else {
            return nil
        }
        
        if let dateTime = dates.dateTime {
            return dateTime.timeAndDateAsString()
        }
        
        if dates.timeTBA {
            return "Time TBA, \(dates.localDate?.dateAsString() ?? "")"
        }
        
        if dates.noSpecificTime {
            return dates.localDate?.dateAsString()
        }
        
        if dates.dateTBD {
            return "Date TBD"
        }
        
        if dates.dateTBA {
            return "Date TBA"
        }
        
        return nil
    }
    
    func makeImagesUrls(from eventImages: [EventImageDomain]?) -> [URL] {
        eventImages?.compactMap { $0.url } ?? []
    }
}
