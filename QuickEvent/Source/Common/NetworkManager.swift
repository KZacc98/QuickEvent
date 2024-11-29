//
//  NetworkManager.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//

import Foundation
import Combine

class NetworkManager {
    func fetch<T: Decodable>(url: URL) -> AnyPublisher<T, NetworkError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { result -> Data in
                guard let httpResponse = result.response as? HTTPURLResponse else {
                    throw NetworkError.unknown
                }
                switch httpResponse.statusCode {
                case 200...299:
                    return result.data
                case 400:
                    throw NetworkError.badRequest(statusCode: httpResponse.statusCode)
                case 401:
                    throw NetworkError.unauthorized
                case 403:
                    throw NetworkError.forbidden
                case 404:
                    throw NetworkError.notFound
                case 500...599:
                    throw NetworkError.serverError(statusCode: httpResponse.statusCode)
                default:
                    throw NetworkError.unknown
                }
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                if let networkError = error as? NetworkError {
                    return networkError
                } else if let decodingError = error as? DecodingError {
                    return NetworkError.dataCorrupted(description: decodingError.localizedDescription)
                } else if (error as NSError).code == URLError.timedOut.rawValue {
                    return NetworkError.timeout
                } else {
                    return NetworkError.unknown
                }
            }
            .eraseToAnyPublisher()
    }
}
