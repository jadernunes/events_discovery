//
//  ListEventsCoordinator.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-27.
//

import UIKit

protocol IListEventsCoordinator {
    
}

final class ListEventsCoordinator: IListEventsCoordinator {

    // MARK: - Attributes

    private weak var presenter: UINavigationController?

    // MARK: - Life cycle

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    // MARK: - Custom methods

    func start() {
        let viewModel = ListEventsViewModel(coordinator: self)
        let viewController = ListEventsViewController(viewModel: viewModel)
        presenter?.viewControllers = [viewController]
    }
}
