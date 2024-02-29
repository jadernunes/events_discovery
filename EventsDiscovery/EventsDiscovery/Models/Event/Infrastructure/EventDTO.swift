//
//  EventDTO.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

import Foundation

struct EventDTO: Decodable {
    let id: String
    let name: String
    let images: [ImagesDTO]
    let ageRestrictions: AgeRestrictionDTO?
    
    var asEvent: Event {
        let urlString = images.first?.url.absoluteString ?? ""
        return Event(id: id,
                     name: name,
                     legalAgeEnforced: ageRestrictions?.legalAgeEnforced,
                     urlString: urlString)
    }
}
