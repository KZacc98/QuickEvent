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
    
    func toDomain() -> StartDateDomain {
        StartDateDomain(
            localDate: localDate?.toDate(),
            localTime: localTime,
            dateTime: dateTime?.toDateTime(),
            dateTBD: dateTBD ?? false,
            dateTBA: dateTBA ?? false,
            timeTBA: timeTBA ?? false,
            noSpecificTime: noSpecificTime ?? false
        )
    }
}


import Foundation

struct StartDateDomain {
    let localDate: Date?
    let localTime: String?
    let dateTime: Date?
    let dateTBD: Bool
    let dateTBA: Bool
    let timeTBA: Bool
    let noSpecificTime: Bool
}
