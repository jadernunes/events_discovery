//
//  ListEventsResourcesTests.swift
//  EventsDiscoveryTests
//
//  Created by Jader Nunes on 2024-02-29.
//

import Foundation

import XCTest
@testable import EventsDiscovery

final class ListEventsResourcesTests: XCTestCase {
    
    func testListEventsResourcesNoSearch() {
        let resources = ListEventsResources.loadAll(page: 1, searchText: "")
        XCTAssertEqual(resources.method, .get)
        XCTAssertEqual(resources.path, "/v2/events.json")
        
        XCTAssertEqual(resources.parameters?["apikey"] as? String, Config.apiKey)
        XCTAssertEqual(resources.parameters?["page"] as? Int, 1)
        XCTAssertEqual(resources.parameters?["size"] as? Int, 20)
    }

    func testListEventsResourcesWithSearch() {
        let resources = ListEventsResources.loadAll(page: 1, searchText: "a")
        XCTAssertEqual(resources.parameters?["keyword"] as? String, "a")
    }
}
