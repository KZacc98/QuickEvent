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
            Text("date".localized)
                .padding(.top, 40)
            Picker("date".localized, selection: $eventDateOrder) {
                Text("descending".localized).tag(FilterType.descending)
                Text("recomended".localized).tag(FilterType.recommended)
                Text("ascending".localized).tag(FilterType.ascending)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
        }
    }
}



