//
//  StaticMapView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 01/12/2024.
//

import SwiftUI
import MapKit

struct StaticMapView: View {
    let coordinate: CLLocationCoordinate2D
    @State private var mapImage: UIImage? = nil
    @State private var mapLoaded = false
    
    var body: some View {
        VStack {
            if let mapImage = mapImage {
                Image(uiImage: mapImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        openInMaps()
                    }
            } else {
                ProgressView("Loading Map...")
                    .tint(Color("BabyPowder"))
                    .foregroundColor(Color("BabyPowder"))
            }
        }
        .onAppear {
            generateSnapshot()
        }
    }
    
    private func generateSnapshot() {
        let mapSnapshotOptions = MKMapSnapshotter.Options()
        let region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000
        )
        mapSnapshotOptions.region = region
        mapSnapshotOptions.showsBuildings = true
        mapSnapshotOptions.size = CGSize(width: 400, height: 300)
        mapSnapshotOptions.scale = UIScreen.main.scale
        
        let snapshotter = MKMapSnapshotter(options: mapSnapshotOptions)
        snapshotter.start { snapshot, error in
            if let error = error {
                print("Error generating map snapshot: \(error.localizedDescription)")
                return
            }
            
            if let snapshot = snapshot {
                withAnimation(.easeIn(duration: 0.3)) {
                    mapLoaded = true
                    self.mapImage = snapshot.image
                }
                
            }
        }
    }
    
    private func openInMaps() {
        let regionDistance: CLLocationDistance = 1000
        let coordinates = coordinate
        let regionSpan = MKCoordinateRegion(center: coordinates,
                                            latitudinalMeters: regionDistance,
                                            longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Selected Location"
        mapItem.openInMaps(launchOptions: options)
    }
}
