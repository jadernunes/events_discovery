//
//  EncodableTests.swift
//  EventsDiscoveryTests
//
//  Created by Jader Nunes on 2024-02-29.
//

import XCTest
@testable import EventsDiscovery

final class EncodableTests: XCTestCase {

    func testEncodableToJson() {
        let key = "name"
        let name = "a"
        struct Test: Codable {
            let name: String
        }

        let model = Test(name: name)
        let json = model.toJson()
        XCTAssertEqual(json.keys.first, key)

        let value = json[key] as? String
        XCTAssertEqual(value, name)
    }
}
