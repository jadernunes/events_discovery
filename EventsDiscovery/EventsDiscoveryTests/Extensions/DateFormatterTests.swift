//
//  DateFormatterTests.swift
//  EventsDiscoveryTests
//
//  Created by Jader Nunes on 2024-02-29.
//

import XCTest
@testable import EventsDiscovery

final class DateFormatterTests: XCTestCase {
    
    func testDateFormatReceived() {
        XCTAssertEqual(DateFormatter.dateFormatterReveiced.dateFormat, DateFormatType.serverShort.rawValue)
    }
    
    func testDateTypeExpected() {
        XCTAssertEqual(DateFormatType.serverLong.rawValue, "yyyy-MM-dd hh:mm:ss")
        XCTAssertEqual(DateFormatType.serverShort.rawValue, "yyyy-MM-dd")
    }
}
