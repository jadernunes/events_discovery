//
//  ListEventsService.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

import Foundation

protocol IListEventsService {
    func laodAll(page: Int, searchText: String) async throws -> EventResultDTO
}

struct ListEventsService: IListEventsService {
    
    // MARK: - Properties
    
    private let network: INetwork
    
    // MARK: - Life cycle
    
    init(network: INetwork = NetworkInstance) {
        self.network = network
    }
    
    // MARK: - Methods
    
    func laodAll(page: Int, searchText: String) async throws -> EventResultDTO {
        try await network
            .makeRequest(requester: ListEventsResources
                .loadAll(page: page, searchText: searchText)
        )
    }
}
