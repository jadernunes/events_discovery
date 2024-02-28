//
//  Localize.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

import Foundation

struct Localize {
    
    static func string(key: String) -> String {
        let textLocalised = NSLocalizedString(key, comment: "")
        return key == textLocalised ? "" : textLocalised
    }
}
