//
//  ListEventsViewModel.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-27.
//

import Combine
import Foundation
import SwiftUI

protocol IListEventsViewModel: ObservableObject {
    var state: ListEventsState { get }
    var search: String { get set }

    func shouldShowLoadMore(currentEvent: Event) -> Bool
    func loadData(currentEvent: Event?) async
}

final class ListEventsViewModel: IListEventsViewModel {
    
    // MARK: - Properties
    
    @Published var state: ListEventsState = .idle
    @Published var search: String = ""
    
    private let coordinator: IListEventsCoordinator?
    private let service: IListEventsService
    private var events = [Event]()
    private var searchedText: String = ""
    private var cancelables = Set<AnyCancellable>()
    
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
        
        bindSearchText()
    }
    
    // MARK: - Methods
    
    func loadData(currentEvent: Event?) async {
        if currentEvent == nil {
            await restartPagination()
        }
        
        let isCurrentEventEqualToLast = currentEvent == events.last
        
        guard isCurrentEventEqualToLast &&
                hasLoadedAll == false ||
                state == .error else {
            return
        }
        
        await requestData()
    }
    
    func shouldShowLoadMore(currentEvent: Event) -> Bool {
        let isCurrentEventEqualToLast = currentEvent == events.last
        let isEventsNotEmpty = events.isEmpty == false
        let isSearchNotEmpty = searchedText.isEmpty == false
        
        return (isCurrentEventEqualToLast && isEventsNotEmpty) ||
               (isCurrentEventEqualToLast && isSearchNotEmpty)
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
            let data = try await service.laodAll(page: page, searchText: searchedText)
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
    
    private func bindSearchText() {
        $search
            .debounce(for: 0.7, scheduler: RunLoop.main)
            .sink { [weak self] in
                guard let self else { return }
                
                guard ($0.isEmpty == false || self.searchedText.isEmpty == false),
                      $0 != self.searchedText
                else { return }
                
                self.searchedText = $0
                
                Task {
                    await self.restartPagination()
                    await self.requestData()
                }
            }
            .store(in: &cancelables)
    }
}
