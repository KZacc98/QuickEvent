//
//  DetailsBackgroundView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

import SwiftUI

struct DetailsBackgroundView: View {
    
    var imageUrl: URL?
    @State private var imageLoaded = false

    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        AsyncImage(url: imageUrl) { image in
            image
                .resizable()
                .scaledToFill()
                .opacity(imageLoaded ? 1.0 : 0.0)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.0)) {
                        imageLoaded = true
                    }
                }
        } placeholder: {
            Color.clear
        }
        .overlay {
            Color.clear.background(.ultraThinMaterial).opacity(0.95)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    DetailsBackgroundView(
        imageUrl: URL(
            string: "https://cdn.sanity.io/images/599r6htc/regionalized/6e108c6e21c875f750b484fd90e2e26e6e597297-1320x743.png"
        ))
}
