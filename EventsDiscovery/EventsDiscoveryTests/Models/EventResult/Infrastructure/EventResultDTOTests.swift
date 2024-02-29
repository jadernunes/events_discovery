//
//  EventResultDTOTests.swift
//  EventsDiscoveryTests
//
//  Created by Jader Nunes on 2024-02-29.
//

import XCTest
@testable import EventsDiscovery

final class EventResultDTOTests: XCTestCase {
    
    func testEventResultDTODecoded() throws {
        guard let jsonString = """
        {
            "_embedded": {
                "events": [
                    {
                        "id": "123456",
                        "name": "Sample Event",
                        "images": [
                            {
                                "url": "https://example.com/image1.jpg"
                            },
                            {
                                "url": "https://example.com/image2.jpg"
                            }
                        ],
                        "ageRestrictions": {
                            "legalAgeEnforced": true
                        }
                    }
                ]
            }
        }
        """.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        let eventResultDTO = try? JSONDecoder.decoder.decode(EventResultDTO.self, from: jsonString)
        let eventDTO = eventResultDTO?.embedded.events.first
        
        XCTAssertEqual(eventDTO?.id, "123456")
        XCTAssertEqual(eventDTO?.name, "Sample Event")
        XCTAssertEqual(eventDTO?.images[0].url.absoluteString, "https://example.com/image1.jpg")
        XCTAssertEqual(eventDTO?.images[1].url.absoluteString, "https://example.com/image2.jpg")
        XCTAssertEqual(eventDTO?.ageRestrictions?.legalAgeEnforced, true)
        
        let event = eventDTO?.asEvent
        
        XCTAssertEqual(event?.id, "123456")
        XCTAssertEqual(event?.name, "Sample Event")
        XCTAssertEqual(event?.urlString, "https://example.com/image1.jpg")
        XCTAssertEqual(event?.legalAgeEnforced, true)
    }
}
