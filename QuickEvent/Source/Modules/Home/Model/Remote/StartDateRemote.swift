//
//  StartDateRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//



struct StartDateRemote: Codable {
    let localDate: String?
    let localTime: String?
    let dateTime: String?
    let dateTBD: Bool?
    let dateTBA: Bool?
    let timeTBA: Bool?
    let noSpecificTime: Bool?
}