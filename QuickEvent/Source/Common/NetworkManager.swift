//
//  NetworkManager.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//

import Foundation
import Combine

class NetworkManager {
    func fetch(from url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output -> Data in
                guard let httpResponse = output.response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse, userInfo: [NSLocalizedDescriptionKey: "invalidResponse".localized])
                }
                
                guard 200..<300 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse, userInfo: [
                        NSLocalizedDescriptionKey: String(format: "errorWithCode".localized, httpResponse.statusCode),
                        "HTTPStatusCode": httpResponse.statusCode
                    ])
                }
                
                return output.data
            }
            .eraseToAnyPublisher()
    }
    
    func fetch(from url: URL) async -> Result<Data, Error> {
        do {
            let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(URLError(.badServerResponse, userInfo: [NSLocalizedDescriptionKey: "invalidResponse".localized]))
            }
            
            guard 200..<300 ~= httpResponse.statusCode else {
                return .failure(URLError(.badServerResponse, userInfo: [
                    NSLocalizedDescriptionKey: String(format: "errorWithCode".localized, httpResponse.statusCode),
                    "HTTPStatusCode": httpResponse.statusCode
                ]))
            }
            
            return .success(data)
        } catch {
            return .failure(error)
        }
    }
}
