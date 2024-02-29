//
//  NetworkErrorTypeTests.swift
//  EventsDiscoveryTests
//
//  Created by Jader Nunes on 2024-02-29.
//

import XCTest
@testable import EventsDiscovery

final class NetworkErrorTypeTests: XCTestCase {
    
    func testErrorTypeRequest() {
        let error: NetworkErrorType = .noInternet(message: "aaa")
        
        switch error {
        case let .noInternet(message):
            XCTAssertEqual(message, "aaa")
        default:
            XCTFail()
        }
    }
}
