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
    var eventStartDateTime: String
    
    init(eventName: String = "eventName", attractionName: String = "attractionName", eventStartDateTime: String = "HH:mm, dd.MM.yyyy") {
        self.eventName = eventName
        self.attractionName = attractionName
        self.eventStartDateTime = eventStartDateTime
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: 350, height: 200)
                .shadow(radius: 5)
            
            VStack(spacing: 10) {
                Text(eventName)
                    .font(.largeTitle)
                    .frame(width: 320, alignment: .leading)
                    .minimumScaleFactor(0.5)
                Text(attractionName)
                    .font(.title)
                    .frame(width: 320, alignment: .leading)
                    .minimumScaleFactor(0.5)
                Text(eventStartDateTime)
                    .font(.subheadline)
                    .frame(width: 320, alignment: .leading)
                    .minimumScaleFactor(0.5)
            }
            .padding(.horizontal, 10.0)
        }
    }
}

#Preview {
    DetailsEventInfo()
}
