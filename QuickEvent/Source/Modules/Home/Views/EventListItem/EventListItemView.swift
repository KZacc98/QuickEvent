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
                Text(item.eventDate)
                    .font(.caption)
                    .foregroundColor(.black)
                    .padding(8)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding(8)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(item.city)
                    .font(.subheadline)
                    .foregroundColor(.black)
                Text(item.venueName)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.blue)
            .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
        }
        .cornerRadius(20)
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
