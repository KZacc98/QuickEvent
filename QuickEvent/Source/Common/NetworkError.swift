//
//  NetworkError.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//

import Foundation

enum NetworkError: LocalizedError {
    case badRequest(statusCode: Int)
    case unauthorized
    case forbidden
    case notFound
    case serverError(statusCode: Int)
    case timeout
    case invalidResponse
    case dataCorrupted(description: String)
    case unknown

    var errorDescription: String? {
        switch self {
        case .badRequest(let statusCode):
            return "Bad Request - Status Code: \(statusCode)"
        case .unauthorized:
            return "Unauthorized"
        case .forbidden:
            return "Forbidden"
        case .notFound:
            return "Not Found"
        case .serverError(let statusCode):
            return "Server Error - Status Code: \(statusCode)"
        case .timeout:
            return "Request Timed Out"
        case .invalidResponse:
            return "Invalid Response from Server"
        case .dataCorrupted(let description):
            return "Data Corrupted: \(description)"
        case .unknown:
            return "Unknown Error"
        }
    }
}

