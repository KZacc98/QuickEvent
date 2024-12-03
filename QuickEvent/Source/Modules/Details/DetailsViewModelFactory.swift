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
            return String(format: "timeTBA".localized, dates.localDate?.dateAsString() ?? "")
        }
        
        if dates.noSpecificTime {
            return dates.localDate?.dateAsString()
        }
        
        if dates.dateTBD {
            return "dateTBD".localized
        }
        
        if dates.dateTBA {
            return "dateTBA".localized
        }
        
        return nil
    }
    
    func makeImagesUrls(from eventImages: [EventImageDomain]?) -> [URL] {
        eventImages?.compactMap { $0.url } ?? []
    }
}
