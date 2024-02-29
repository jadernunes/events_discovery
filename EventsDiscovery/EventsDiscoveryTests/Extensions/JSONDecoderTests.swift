//
//  JSONDecoderTests.swift
//  EventsDiscoveryTests
//
//  Created by Jader Nunes on 2024-02-29.
//

import XCTest
@testable import EventsDiscovery

final class JSONDecoderTests: XCTestCase {
    
    func testDecoderStrategy() {
        guard let jsonData = """
            {
                "legalAgeEnforced": false
            }
            """.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        let decodedObject = try? JSONDecoder.decoder.decode(AgeRestrictionDTO.self, from: jsonData)
        
        XCTAssertNotNil(decodedObject)
        XCTAssertEqual(decodedObject?.legalAgeEnforced, false)
    }
}
