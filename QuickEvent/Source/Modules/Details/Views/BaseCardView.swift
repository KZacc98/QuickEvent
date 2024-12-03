//
//  BaseCardView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 02/12/2024.
//

import SwiftUI

struct BaseCardView<Content: View>: View {
    private let content: Content
    private let infoImage: Image?
    private let infoText: String?
    private let showChevron: Bool
    
    init(infoImage: Image?,
         infoText: String?,
         showChevron: Bool = false,
         @ViewBuilder content: () -> Content) {
        self.content = content()
        self.infoImage = infoImage
        self.infoText = infoText
        self.showChevron = showChevron
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            
            HStack(spacing: 5) {
                if let infoImage {
                    infoImage
                        .foregroundColor(Color.babyPowder)
                }
                
                Text(infoText ?? "")
                    .fontWeight(.thin)
                    .foregroundStyle(Color.babyPowder)
                
                Spacer()
                
                if showChevron {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.babyPowder)
                }
                
            }
            .padding([.top, .leading, .trailing], 10)
            
            content
                .padding(.bottom, 10)
        }
        .frame(maxWidth: 350)
        .background(Color.lapisBlue)
        .shadow(radius: 10)
        .cornerRadius(15)
    }
}
