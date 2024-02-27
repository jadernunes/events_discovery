//
//  AppCoordinator.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-27.
//

import UIKit

final class AppCoordinator {

    // MARK: - Attributes

    private let window: UIWindow?
    private let initialFlow: InitialFlow

    // MARK: - Life cycle

    init(window: UIWindow?, initialFlow: InitialFlow = .splashScreen) {
        self.window = window
        self.initialFlow = initialFlow
    }

    // MARK: - Attributes

    func start() {
        switch initialFlow {
        case .splashScreen:
            openSplashScreen()
        case .listEvents:
            openListEvents()
        }
    }

    // MARK: - Navigations

    private func openSplashScreen() {
        // TODO: - Handle it
    }

    private func openListEvents() {
        // TODO: - Handle it
    }
}
