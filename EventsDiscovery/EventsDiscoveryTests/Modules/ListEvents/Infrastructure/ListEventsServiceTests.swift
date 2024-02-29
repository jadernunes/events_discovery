//
//  ListEventsServiceTests.swift
//  EventsDiscoveryTests
//
//  Created by Jader Nunes on 2024-02-29.
//

import XCTest
@testable import EventsDiscovery

final class ListEventsServiceTests: XCTestCase {
    
    func testLoadAllSuccess() async throws {
        guard let url = URL(string: "http://www.google.com") else { return }
                
        let dto = EventResultDTO(
            embedded: EmbeddedDTO(
                events: [
                    EventDTO(
                        id: "1",
                        name: "a",
                        images: [ImagesDTO(url: url)],
                        ageRestrictions: AgeRestrictionDTO(legalAgeEnforced: true))]))
        
        let network = NetworkMock(data: dto)
        let service = ListEventsService(network: network)
        let result = try await service.laodAll(page: 1, searchText: "")
        
        let events = result.embedded.events
        XCTAssertEqual(events.count, 1)
        
        let firstEvent = events.first?.asEvent
        XCTAssertEqual(firstEvent?.id, "1")
        XCTAssertEqual(firstEvent?.name, "a")
        XCTAssertEqual(firstEvent?.urlString, "http://www.google.com")
        XCTAssertEqual(firstEvent?.legalAgeEnforced, true)
    }
}
