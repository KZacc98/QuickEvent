//
//  FilterView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 03/12/2024.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var eventDateOrder: FilterType
    
    var body: some View {
        VStack {
            Text("Date")
                .padding(.top, 40)
            Picker("Date", selection: $eventDateOrder) {
                Text("Descending").tag(FilterType.descending)
                Text("Recomended").tag(FilterType.recommended)
                Text("Ascending").tag(FilterType.ascending)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
        }
    }
}



