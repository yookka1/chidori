//
//  Endpoint.swift
//  chidori
//
//  Created by Yookka1 on 26.11.22.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var method: RequestMethod { get }
    var headers: [String: String]? { get }
    var path: String { get }
    var parameters: [URLQueryItem]? { get }
}
