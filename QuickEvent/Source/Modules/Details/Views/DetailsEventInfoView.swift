//
//  DetailsEventInfoView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

import SwiftUI

struct DetailsEventInfoView: View {
    private var eventName: String?
    private var attractionName: String?
    private var eventDate: String?
    private var eventType: String?
    
    init(
        eventName: String? = "EventName",
        attractionName: String? = "AttractionName",
        eventDate: String? = "EventDate",
        eventType: String? = "EventType") {
            self.eventName = eventName
            self.attractionName = attractionName
            self.eventDate = eventDate
            self.eventType = eventType
        }
    
    var body: some View {
        BaseCardView(infoImage: Image(systemName: "info.circle.fill"), infoText: eventType) {
            if let eventName {
                Text(eventName)
                    .font(.title)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.5)
                    .lineLimit(3)
                    .foregroundStyle(Color("BabyPowder"))
                    .frame(minWidth: 320, maxWidth: 320, minHeight: 20, maxHeight: 75, alignment: .center)
                    .padding(.horizontal, 10)
            }
            
            if let attractionName {
                Text(attractionName)
                    .font(.title3)
                    .fontWeight(.medium)
                    .minimumScaleFactor(0.5)
                    .lineLimit(3)
                    .foregroundStyle(Color("BabyPowder"))
                    .frame(minWidth: 320, maxWidth: 320, minHeight: 20, maxHeight: 50, alignment: .center)
                    .padding(.horizontal, 10)
            }
            
            if let eventDate {
                Text(eventDate)
                    .font(.headline)
                    .fontWeight(.thin)
                    .minimumScaleFactor(0.5)
                    .lineLimit(3)
                    .foregroundStyle(Color("BabyPowder"))
                    .frame(minWidth: 320, maxWidth: 320, minHeight: 20, maxHeight: 50, alignment: .center)
                    .padding([.horizontal, .bottom], 10)
            }
        }
    }
}
