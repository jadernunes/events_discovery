//
//  ListEventsState.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

import Foundation

enum ListEventsState: Equatable {
    case idle, error, loading, empty, ready(events: [Event])

    static func == (lhs: ListEventsState, rhs: ListEventsState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.error, .error), (.loading, .loading), (.empty, .empty):
            return true
        case let (.ready(events1), .ready(events2)):
            return events1 == events2
        default:
            return false
        }
    }
}
