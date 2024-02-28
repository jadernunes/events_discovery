//
//  ListEventsViewModel.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-27.
//

import Foundation

protocol IListEventsViewModel: ObservableObject {
    var events: [Event] { get }
    
    func loadData(currentEvent: Event?) async
}

final class ListEventsViewModel: IListEventsViewModel {
    
    // MARK: - Properties
    
    @Published private(set) var events = [Event]()
    
    private let coordinator: IListEventsCoordinator?
    private let service: IListEventsService
    
    //Pagination control
    private var page: Int = 1
    private var hasLoadedAll = false
    
    // MARK: - Life cycle
    
    init(coordinator: IListEventsCoordinator? = nil,
         service: IListEventsService = ListEventsService()) {
        self.coordinator = coordinator
        self.service = service
    }
    
    // MARK: - Methods
    
    @MainActor
    private func restartPagination() async {
        page = 1
        hasLoadedAll = false
        events = []
    }
    
    func loadData(currentEvent: Event?) async {
        if currentEvent == nil {
            await restartPagination()
        }
        
        guard currentEvent == events.last && hasLoadedAll == false else { return }
        
        await requestData()
    }
    
    @MainActor
    private func requestData() async {
        do {
            let data = try await service.laodAll(page: page)

            let isListEmpty = data.embedded.events.isEmpty
            hasLoadedAll = isListEmpty
            page += 1
            
            events.append(contentsOf: data.embedded.events.map { $0.asEvent })
        } catch {
            // TODO: - Handle error state
        }
    }
}
