//
//  NetworkService.swift
//  chidori
//
//  Created by Yookka1 on 26.11.22.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    func performRequest<T: Decodable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.percentEncodedHost = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.parameters

        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue

        if let headers = endpoint.headers {
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }

        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                if let data = data {
                    let obj = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(obj))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
