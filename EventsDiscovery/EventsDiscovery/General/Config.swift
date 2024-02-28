//
//  Config.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-27.
//

import UIKit

final class Config {

    // MARK: - Properties

    static var baseURL: String {
        configKey(key: "apiKey")
    }

    // MARK: - Methods

    private static func configKey(key: String) -> String {
        guard
            let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
            let dictionary = NSDictionary(contentsOfFile: path) as? [String: Any],
            let value = dictionary[key] as? String
        else { return "" }
        return value
    }
}
