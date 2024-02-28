//
//  DateFormatter+Extension.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

import Foundation

extension DateFormatter {

    static let dateFormatterReveiced: DateFormatter = {
        $0.dateFormat = "yyyy-MM-dd"
        return $0
    }(DateFormatter())

    static let dateFormatterShow: DateFormatter = {
        $0.locale = Locale.current
        $0.timeZone = .current
        return $0
    }(DateFormatter())
}
