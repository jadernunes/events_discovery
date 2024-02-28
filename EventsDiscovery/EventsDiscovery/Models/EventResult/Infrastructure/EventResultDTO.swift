//
//  EventResultDTO.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

import Foundation

struct EventResultDTO: Decodable {
    let embedded: EmbeddedDTO
    
    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}
