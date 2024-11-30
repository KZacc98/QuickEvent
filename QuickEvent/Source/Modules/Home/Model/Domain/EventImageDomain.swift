//
//  EventImageDomain.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//

import Foundation

struct EventImageDomain: Equatable, Identifiable {
    let id: UUID = UUID()
    let ratio: ImageRatio
    let url: URL?
    let width: Int
    let height: Int
    let fallback: Bool?
}
