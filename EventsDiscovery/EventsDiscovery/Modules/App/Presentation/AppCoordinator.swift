//
//  AppCoordinator.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-27.
//

import UIKit

final class AppCoordinator {

    // MARK: - Properties

    private let window: UIWindow?
    private let initialFlow: InitialFlow

    // MARK: - Life cycle

    init(window: UIWindow?, initialFlow: InitialFlow = .listEvents) {
        self.window = window
        self.initialFlow = initialFlow
    }

    // MARK: - Methods

    func start() {
        switch initialFlow {
        case .listEvents:
            openListEvents()
        }
    }

    // MARK: - Navigations

    private func openListEvents() {
        let navigation = UINavigationController()
        let coodinator = ListEventsCoordinator(presenter: navigation)
        coodinator.start()

        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
