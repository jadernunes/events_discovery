//
//  ListEventsViewModel.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-27.
//

import Foundation

protocol IListEventsViewModel: ObservableObject {}

final class ListEventsViewModel: IListEventsViewModel {
    
    // MARK: - Properties
    
    private let coordinator: IListEventsCoordinator?
    
    // MARK: - Life cycle
    
    init(coordinator: IListEventsCoordinator? = nil) {
        self.coordinator = coordinator
    }
}
