//
//  EventImageDomain.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//


struct EventImageDomain: Equatable {
    let ratio: ImageRatio
    let url: String?
    let width: Int
    let height: Int
    let fallback: Bool?
}