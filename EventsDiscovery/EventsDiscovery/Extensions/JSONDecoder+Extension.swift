//
//  JSONDecoder+Extension.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

import Foundation

extension JSONDecoder {

    static let decoder: JSONDecoder = {
        $0.dateDecodingStrategy = .formatted(.dateFormatterReveiced)
        return $0
    }(JSONDecoder())
}
