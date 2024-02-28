//
//  JSONEncoder+Extension.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

import Foundation

extension JSONEncoder {

    static let encoder: JSONEncoder = {
        $0.dateEncodingStrategy = .formatted(.dateFormatterReveiced)
        return $0
    }(JSONEncoder())
}
