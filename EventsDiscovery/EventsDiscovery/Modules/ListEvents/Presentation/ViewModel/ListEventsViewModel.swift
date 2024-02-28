//
//  ListEventsViewModel.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-27.
//

import Foundation

protocol IListEventsViewModel: ObservableObject {
    var state: ListEventsState { get }

    func shouldShowLoadMore(currentEvent: Event) -> Bool
    func loadData(currentEvent: Event?) async
}

final class ListEventsViewModel: IListEventsViewModel {
    
    // MARK: - Properties
    
    @Published var state: ListEventsState = .idle
    
    private let coordinator: IListEventsCoordinator?
    private let service: IListEventsService
    private var events = [Event]()
    
    //Pagination control
    private var page: Int = 1
    private var hasLoadedAll = false
    private var noEvents: Bool {
        events.isEmpty
    }
    
    private var shouldShowEmptyState: Bool {
        hasLoadedAll && noEvents
    }
    
    // MARK: - Life cycle
    
    init(coordinator: IListEventsCoordinator? = nil,
         service: IListEventsService = ListEventsService()) {
        self.coordinator = coordinator
        self.service = service
    }
    
    // MARK: - Methods
    
    func loadData(currentEvent: Event?) async {
        if currentEvent == nil {
            await restartPagination()
        }
        
        guard currentEvent == events.last && hasLoadedAll == false || state == .error else {
            return
        }
        
        await requestData()
    }
    
    func shouldShowLoadMore(currentEvent: Event) -> Bool {
        currentEvent == events.last && events.isEmpty == false
    }
    
    @MainActor
    private func restartPagination() async {
        page = 1
        hasLoadedAll = false
        events = []
    }
    
    @MainActor
    private func requestData() async {
        if noEvents {
            state = .loading
        }
        
        do {
            let data = try await service.laodAll(page: page)
            let isListEmpty = data.embedded.events.isEmpty
            hasLoadedAll = isListEmpty
            
            if canIncrementPage(isListEmpty) {
                page += 1
            }
            
            if shouldShowEmptyState {
                state = .empty
            }
            
            events.append(contentsOf: data.embedded.events.map { $0.asEvent })
            state = .ready(events: events)
        } catch {
            state = .error
        }
    }
    
    private func canIncrementPage(_ isListEmpty: Bool) -> Bool {
        isListEmpty == false
    }
}
