//
//  AppCoordinatorTests.swift
//  EventsDiscoveryTests
//
//  Created by Jader Nunes on 2024-02-29.
//

import XCTest
@testable import EventsDiscovery

final class AppCoordinatorTests: XCTestCase {
    
    func testAppCoordinatorDefaultFlow() {
        let window = UIWindow()
        let coordinator = AppCoordinator(window: window)
        coordinator.start()
        
        let navigation = window.rootViewController as? UINavigationController
        
        XCTAssertTrue(navigation?.topViewController is ListEventsViewController<ListEventsViewModel>)
    }
}
