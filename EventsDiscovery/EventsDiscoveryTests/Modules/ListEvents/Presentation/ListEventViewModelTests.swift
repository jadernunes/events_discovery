//
//  ListEventViewModelTests.swift
//  EventsDiscoveryTests
//
//  Created by Jader Nunes on 2024-02-29.
//

import XCTest
@testable import EventsDiscovery

final class ListEventViewModelTests: XCTestCase {
    
    func testLoadDataSuccess() async throws {
        guard let url = URL(string: "http://www.google.com") else { return }
                
        let eventDTO = EventDTO(
            id: "1",
            name: "a",
            images: [ImagesDTO(url: url)],
            ageRestrictions: AgeRestrictionDTO(legalAgeEnforced: true))
        let resultDTO = EventResultDTO(embedded: EmbeddedDTO(events: [eventDTO]))
        
        let network = NetworkMock(data: resultDTO)
        let service = ListEventsService(network: network)
        let viewModel = ListEventsViewModel(service: service)
        
        XCTAssertEqual(viewModel.state, .idle)
        await viewModel.loadData(currentEvent: nil)
        
        switch viewModel.state {
        case let .ready(events):
            XCTAssertEqual(events.count, 1)
            let firstEvent = events.first
            
            XCTAssertEqual(firstEvent?.id, "1")
            XCTAssertEqual(firstEvent?.name, "a")
            XCTAssertEqual(firstEvent?.urlString, "http://www.google.com")
            XCTAssertEqual(firstEvent?.legalAgeEnforced, true)
            
            if let firstEvent {
                XCTAssertTrue(viewModel.shouldShowLoadMore(currentEvent: firstEvent))
            }
        default:
            XCTFail()
        }
    }
}
