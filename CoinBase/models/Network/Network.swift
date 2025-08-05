//
//  Network.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
enum NetworkMethods: String {
    case GET, POST, PUT, DELETE
}


enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError(Error)
    case serverError(Int)
    case unknown(Error)
}
