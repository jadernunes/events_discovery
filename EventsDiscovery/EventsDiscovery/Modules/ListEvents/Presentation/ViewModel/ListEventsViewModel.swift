//
//  ListEventsViewModel.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-27.
//

import Foundation

protocol IListEventsViewModel: ObservableObject {
    var events: [Event] { get }
    
    func loadData() async
}

final class ListEventsViewModel: IListEventsViewModel {
    
    // MARK: - Properties
    
    @Published private(set) var events = [Event]()
    
    private let coordinator: IListEventsCoordinator?
    
    // MARK: - Life cycle
    
    init(coordinator: IListEventsCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    @MainActor
    func loadData() async {
        // TODO: - Request data from server
    }
}
