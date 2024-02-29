//
//  Images.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

import SwiftUI

struct Images {
    
    struct NoImage {
        static let uiImage = UIImage(named: "noImage") ?? .no
        static let image = Image(uiImage: uiImage)
    }
}
