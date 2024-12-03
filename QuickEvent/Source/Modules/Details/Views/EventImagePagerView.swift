//
//  EventImagePagerView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 02/12/2024.
//

import SwiftUI

struct EventImagePagerView: View {
    private let images: [URL]
    
    init(images: [URL]) {
        self.images = images
    }
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { url in
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                } placeholder: {
                    ProgressView("Loading...")
                        .tint(Color.babyPowder)
                        .foregroundColor(Color.babyPowder)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .frame(maxWidth: .infinity, minHeight: 200)
    }
}

#Preview {
    EventImagePagerView(images: [])
}
