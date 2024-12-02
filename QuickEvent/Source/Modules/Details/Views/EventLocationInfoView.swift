//
//  EventLocationInfoView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 01/12/2024.
//

import SwiftUI
import MapKit

struct EventLocationInfoView: View {
    var venueName: String
    var address: String
    var venueLocation: LocationDomain?
    
    init(venueName: String = "venueName",
         address: String = "address",
         venueLocation: LocationDomain? = LocationDomain(longitude: 21.04598, latitude: 52.23958)) {
        self.venueName = venueName
        self.address = address
        self.venueLocation = venueLocation
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 5) {
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(Color("BabyPowder"))
                
                Text("Venue Information")
                    .fontWeight(.thin)
                    .foregroundStyle(Color("BabyPowder"))
            }
            .padding([.top, .leading], 10)
            
            if let venueLocation {
                HStack(alignment: .center) {
                    Spacer()
                    StaticMapView(
                        coordinate: CLLocationCoordinate2D(
                            latitude: venueLocation.latitude,
                            longitude: venueLocation.longitude
                        ))
                    .frame(width: 320, alignment: .center)
                    .cornerRadius(15, corners: .allCorners)
                    Spacer()
                }.padding(.vertical, 5)
            }
            
            Text(venueName)
                .font(.headline)
                .fontWeight(.semibold)
                .minimumScaleFactor(0.5)
                .lineLimit(3)
                .foregroundStyle(Color("BabyPowder"))
                .frame(minWidth: 320, maxWidth: 320, minHeight: 20, maxHeight: 75, alignment: .leading)
                .padding(.horizontal, 10)
            
            Text(address)
                .font(.title3)
                .fontWeight(.medium)
                .minimumScaleFactor(0.5)
                .lineLimit(3)
                .foregroundStyle(Color("BabyPowder"))
                .frame(minWidth: 320, maxWidth: 320, minHeight: 20, maxHeight: 50, alignment: .leading)
                .padding([.horizontal, .bottom], 10)
            
        }
        .frame(maxWidth: 350)
        .background(Color("LapisBlue"))
        .shadow(radius: 10)
        .cornerRadius(15, corners: .allCorners)
    }
}

#Preview {
    EventLocationInfoView()
}
