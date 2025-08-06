//
//  Network.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import Foundation

enum NetworkMethods: String {
    case GET, POST, PUT, DELETE
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError(Error)
    case serverError(Int)
    case unknown(Error)
    case custom(String)
}


extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .serverError(let code):
            return "Server error: \(code)"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        case .custom(let message):
            return message
        }
    }
}

struct ServerErrorResponse: Decodable {
    let status: String
    let code: String
    let message: String
}

