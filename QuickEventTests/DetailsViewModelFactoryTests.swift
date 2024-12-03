//
//  DetailsViewModelFactoryTests.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 03/12/2024.
//

import XCTest

class DetailsViewModelFactoryTests: XCTestCase {
    
    var factory: DetailsViewModelFactory?

    override func setUp() {
        super.setUp()
        factory = DetailsViewModelFactory()
    }
    
    func testFullDateAndTime() {
        let startDate = StartDateDomain(
            localDate: Date(),
            localTime: nil,
            dateTime: Date(),
            dateTBD: false,
            dateTBA: false,
            timeTBA: false,
            noSpecificTime: false
        )
        
        let result = factory?.makeDateString(dates: startDate)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result, startDate.dateTime?.timeAndDateAsString(), "Expected the full date and time")
    }
    
    func testTimeTBA() {
        let startDate = StartDateDomain(
            localDate: Date(),
            localTime: nil,
            dateTime: nil,
            dateTBD: false,
            dateTBA: false,
            timeTBA: true,
            noSpecificTime: true
        )
        
        let result = factory?.makeDateString(dates: startDate)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result, "Time TBA, \(startDate.localDate?.dateAsString() ?? "")", "Expected Time TBA with date if available")
    }

    func testDateTBD() {
        let startDate = StartDateDomain(
            localDate: nil,
            localTime: nil,
            dateTime: nil,
            dateTBD: true,
            dateTBA: false,
            timeTBA: false,
            noSpecificTime: false
        )
        
        let result = factory?.makeDateString(dates: startDate)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result, "Date TBD", "Expected Date TBD")
    }
    
    func testDateTBA() {
        let startDate = StartDateDomain(
            localDate: nil,
            localTime: nil,
            dateTime: nil,
            dateTBD: false,
            dateTBA: true,
            timeTBA: false,
            noSpecificTime: false
        )
        
        let result = factory?.makeDateString(dates: startDate)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result, "Date TBA", "Expected Date TBA")
    }
    
    func testNoSpecificTimeWithDate() {
        let startDate = StartDateDomain(
            localDate: Date(),
            localTime: nil,
            dateTime: nil,
            dateTBD: false,
            dateTBA: false,
            timeTBA: false,
            noSpecificTime: true
        )
        
        let result = factory?.makeDateString(dates: startDate)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result, Date().dateAsString(), "Expected Date or empty")
    }
    
    func testFullyPopulatedWithLocalTime() {
        let startDate = StartDateDomain(
            localDate: Date(),
            localTime: "12:00",
            dateTime: Date(),
            dateTBD: false,
            dateTBA: false,
            timeTBA: false,
            noSpecificTime: false
        )
        
        let result = factory?.makeDateString(dates: startDate)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result, startDate.dateTime?.timeAndDateAsString(), "Expected full date and time")
    }
}
