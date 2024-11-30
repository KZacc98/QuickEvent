//
//  EventDatesRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//

struct EventDatesRemote: Codable {
    let start: StartDateRemote?
    let timezone: String?
    let spanMultipleDays: Bool?
}
