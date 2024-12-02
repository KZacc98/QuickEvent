//
//  DetailsEventInfo.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

import SwiftUI

struct DetailsEventInfo: View {
    var eventName: String
    var attractionName: String
    var eventDates: StartDateDomain?
    
    init(
        eventName: String = "eventName",
        attractionName: String = "attractionName",
        eventDates: StartDateDomain? = StartDateDomain(
            localDate: Date(),
            localTime: "12:00",
            dateTime: Date(),
            dateTBD: false,
            dateTBA: false,
            timeTBA: false,
            noSpecificTime: false
        )) {
        self.eventName = eventName
        self.attractionName = attractionName
        self.eventDates = eventDates
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 5) {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(Color("BabyPowder"))
                
                Text("Event information")
                    .fontWeight(.thin)
                    .foregroundStyle(Color("BabyPowder"))
            }
            .padding([.top, .leading], 10)
            
            Text(eventName)
                .font(.title)
                .fontWeight(.semibold)
                .minimumScaleFactor(0.5)
                .lineLimit(3)
                .foregroundStyle(Color("BabyPowder"))
                .frame(minWidth: 320, maxWidth: 320, minHeight: 20, maxHeight: 75, alignment: .center)
                .padding(.horizontal, 10)
            
            Text(attractionName)
                .font(.title3)
                .fontWeight(.medium)
                .minimumScaleFactor(0.5)
                .lineLimit(3)
                .foregroundStyle(Color("BabyPowder"))
                .frame(minWidth: 320, maxWidth: 320, minHeight: 20, maxHeight: 50, alignment: .center)
                .padding(.horizontal, 10)
            
            if let date = makeDateString() {
                Text(date)
                    .font(.headline)
                    .fontWeight(.thin)
                    .minimumScaleFactor(0.5)
                    .lineLimit(3)
                    .foregroundStyle(Color("BabyPowder"))
                    .frame(minWidth: 320, maxWidth: 320, minHeight: 20, maxHeight: 50, alignment: .center)
                    .padding([.horizontal, .bottom], 10)
            }
           
            
            
        }
        .frame(maxWidth: 350)
        .background(Color("LapisBlue"))
        .shadow(radius: 10)
        .cornerRadius(15, corners: .allCorners)
    }
    
    func makeDateString() -> String? {
        guard let dates = eventDates else {
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

#Preview {
    VStack {
        // Case 1: Full date and time specified
        DetailsEventInfo(eventDates: StartDateDomain(
            localDate: Date(),
            localTime: nil,
            dateTime: Date(),
            dateTBD: false,
            dateTBA: false,
            timeTBA: false,
            noSpecificTime: false
        ))
        
        // Case 2: Time TBA (no specific time)
        DetailsEventInfo(eventDates: StartDateDomain(
            localDate: Date(),
            localTime: nil,
            dateTime: nil,
            dateTBD: false,
            dateTBA: false,
            timeTBA: true,
            noSpecificTime: true
        ))

        // Case 3: Date TBD
        DetailsEventInfo(eventDates: StartDateDomain(
            localDate: nil,
            localTime: nil,
            dateTime: nil,
            dateTBD: true,
            dateTBA: false,
            timeTBA: false,
            noSpecificTime: false
        ))
        
        // Case 4: Date TBA
        DetailsEventInfo(eventDates: StartDateDomain(
            localDate: nil,
            localTime: nil,
            dateTime: nil,
            dateTBD: false,
            dateTBA: true,
            timeTBA: false,
            noSpecificTime: false
        ))

        // Case 5: No specific time but date exists
        DetailsEventInfo(eventDates: StartDateDomain(
            localDate: Date(),
            localTime: nil,
            dateTime: nil,
            dateTBD: false,
            dateTBA: false,
            timeTBA: false,
            noSpecificTime: true
        ))

        // Case 6: Fully populated with local time specified
        DetailsEventInfo(eventDates: StartDateDomain(
            localDate: Date(),
            localTime: "12:00",
            dateTime: Date(),
            dateTBD: false,
            dateTBA: false,
            timeTBA: false,
            noSpecificTime: false
        ))
    }
}
