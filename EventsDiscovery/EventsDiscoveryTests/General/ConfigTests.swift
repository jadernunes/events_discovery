//
//  ConfigTests.swift
//  EventsDiscoveryTests
//
//  Created by Jader Nunes on 2024-02-29.
//

import XCTest
@testable import EventsDiscovery

final class ConfigTests: XCTestCase {
    
    func testCongigKeysExist() {
        XCTAssertFalse(Config.apiKey.isEmpty)
        XCTAssertFalse(Config.baseURL.isEmpty)
    }
}
