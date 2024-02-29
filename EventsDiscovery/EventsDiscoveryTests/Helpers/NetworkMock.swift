//
//  NetworkMock.swift
//  EventsDiscoveryTests
//
//  Created by Jader Nunes on 2024-02-29.
//

import Foundation
@testable import EventsDiscovery

final class NetworkMock: INetwork {
    
    // MARK: - Properties

    private let data: Decodable?

    // MARK: - Life cycle

    init(data: Decodable) {
        self.data = data
    }

    // MARK: - Methods
    
    func makeRequest<T: Decodable>(requester: Requestable) async throws -> T {
        guard let data = data as? T else {
            throw NetworkErrorType.jsonEncodingFailed(error: NSError(domain: "Fail to decode", code: 0))
        }
        
        return data
    }
}
