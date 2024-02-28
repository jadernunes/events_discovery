//
//  NetworkErrorType.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

enum NetworkErrorType: Error {
    case missingURL
    case jsonEncodingFailed(error: Error)
    case noInternet(message: String = "No internet")
}
