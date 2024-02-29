//
//  ListEventsStateTests.swift
//  EventsDiscoveryTests
//
//  Created by Jader Nunes on 2024-02-29.
//

import XCTest
@testable import EventsDiscovery

final class ListEventsStateTests: XCTestCase {
    
    func testAllStates() {
        let event = Event(id: "1", name: "a", legalAgeEnforced: false, urlString: "b")
        
        let state1: ListEventsState = .ready(events: [event])
        let state2: ListEventsState = .ready(events: [event])
        let state3: ListEventsState = .loading
        let state4: ListEventsState = .empty
        
        XCTAssertEqual(state1, state2)
        XCTAssertNotEqual(state1, state3)
        XCTAssertNotEqual(state1, state4)
        XCTAssertNotEqual(state3, state4)
    }
}
