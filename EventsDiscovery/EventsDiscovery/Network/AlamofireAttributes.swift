//
//  AlamofireAttributes.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

import Alamofire

typealias Params = [String: Any]
typealias URLConvertible = URLRequestConvertible
typealias Headers = HTTPHeaders
typealias NetworkSession = Session
typealias ReachabilityManager = NetworkReachabilityManager
typealias URLEncoder = URLEncoding

let NetworkInstance = Session.default
