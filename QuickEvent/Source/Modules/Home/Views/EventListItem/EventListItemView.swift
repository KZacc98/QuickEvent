//
//  EventListItemView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

import SwiftUI

struct EventListItemView: View {
    let item: EventListItem
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: item.imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 320, height: 180)
                        .cornerRadius(15, corners: [.topLeft, .topRight])
                } placeholder: {
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 320, height: 180)
                            .cornerRadius(15, corners: [.topLeft, .topRight])
                        ProgressView()
                    }
                }
                
                if let eventDate = item.eventDate {
                    Text(eventDate)
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(8)
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                        .padding(8)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                if let title = item.title {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(Color.babyPowder)
                        .padding([.horizontal, .top], 10)
                }
                
                if let city = item.city {
                    Text(city)
                        .font(.subheadline)
                        .foregroundStyle(Color.babyPowder)
                        .padding(.horizontal, 10)
                }
                
                if let venueName = item.venueName {
                    Text(venueName)
                        .font(.subheadline)
                        .foregroundStyle(Color.babyPowder)
                        .padding([.leading, .bottom, .trailing], 10)
                }
            }
            .frame(width: 320, alignment: .leading)
            .background(Color.lapisBlue)
            .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
        }
    }
}

#Preview {
    EventListItemView(item: EventListItem(
        title: "Title",
        eventDate: "12.12.2024",
        city: "Warsaw",
        venueName: "PGE Narodowy",
        imageUrl: URL(optionalString: "https://s1.ticketm.net/dam/a/e8c/5265b9d2-a06c-4dc8-a432-a8dd9d042e8c_RETINA_PORTRAIT_3_2.jpg")))
}
