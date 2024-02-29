//
//  InitialFlowTests.swift
//  EventsDiscoveryTests
//
//  Created by Jader Nunes on 2024-02-29.
//

import XCTest
@testable import EventsDiscovery

final class InitialFlowTests: XCTestCase {
    
    func testEnumInitialFlow() {
        let allCases = InitialFlow.allCases
        let enumeratedCases: [InitialFlow] = [.listEvents]

        XCTAssertEqual(InitialFlow.allCases.count, 1)
        let fistCase = enumeratedCases.first
        XCTAssertEqual(fistCase, .listEvents)

        allCases.forEach {
            XCTAssertEqual(enumeratedCases.contains($0), true)
        }
    }
}
