//
//  ListEventsResources.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

enum ListEventsResources {
    case loadAll(page: Int)
}

extension ListEventsResources: Requestable {
    
    var method: HTTPMethodType {
        switch self {
        case .loadAll:
            return .get
        }
    }
    
    var parameters: Params? {
        switch self {
        case let .loadAll(page):
            return [
                "apikey": Config.apiKey,
                "page": page,
                "size": 20
            ]
        }
    }
    
    var path: String {
        switch self {
        case .loadAll:
            return "/v2/events.json"
        }
    }
}
