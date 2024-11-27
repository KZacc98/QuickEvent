//
//  DetailsView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 27/11/2024.
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    let data: [String]
    
    var body: some View {
        VStack {
            List {
                ForEach(data, id: \.self) { text in
                    Text(text)
                        .onTapGesture {
                            coordinator.push(_screen: .details(data: [text]))
                        }
                }
            }
        }
    }
}

#Preview {
    DetailsView(data: ["1", "2", "3"])
}

