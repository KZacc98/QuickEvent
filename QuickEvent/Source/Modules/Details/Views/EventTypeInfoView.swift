//
//  EventTypeInfoView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 02/12/2024.
//

import SwiftUI

struct EventTypeInfoView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 5) {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(Color.babyPowder)
                
                Text("Event information")
                    .fontWeight(.thin)
                    .foregroundStyle(Color.babyPowder)
            }
            .padding([.top, .leading], 10)
            
            Text("eventName")
                .font(.title)
                .fontWeight(.semibold)
                .minimumScaleFactor(0.5)
                .lineLimit(3)
                .foregroundStyle(Color.babyPowder)
                .frame(minWidth: 320, maxWidth: 320, minHeight: 20, maxHeight: 75, alignment: .center)
                .padding(.horizontal, 10)
            
            Text("attractionName")
                .font(.title3)
                .fontWeight(.medium)
                .minimumScaleFactor(0.5)
                .lineLimit(3)
                .foregroundStyle(Color.babyPowder)
                .frame(minWidth: 320, maxWidth: 320, minHeight: 20, maxHeight: 50, alignment: .center)
                .padding(.horizontal, 10)
            
            Text("date")
                .font(.headline)
                .fontWeight(.thin)
                .minimumScaleFactor(0.5)
                .lineLimit(3)
                .foregroundStyle(Color.babyPowder)
                .frame(minWidth: 320, maxWidth: 320, minHeight: 20, maxHeight: 50, alignment: .center)
                .padding([.horizontal, .bottom], 10)
        }
        .frame(maxWidth: 350)
        .background(Color.lapisBlue)
        .shadow(radius: 10)
        .cornerRadius(15, corners: .allCorners)
    }
}

#Preview {
    VStack {
        EventTypeInfoView()
    }
}
