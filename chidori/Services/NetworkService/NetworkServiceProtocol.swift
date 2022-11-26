//
//  NetworkServiceProtocol.swift
//  chidori
//
//  Created by Yookka1 on 26.11.22.
//

protocol NetworkServiceProtocol: AnyObject {
    func performRequest<T: Decodable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}
