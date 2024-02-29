//
//  DateFormatter+Extension.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

import Foundation

extension DateFormatter {

    static let dateFormatterReveiced: DateFormatter = {
        $0.dateFormat = DateFormatType.serverShort.rawValue
        return $0
    }(DateFormatter())
}
