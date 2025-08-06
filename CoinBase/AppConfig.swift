//
//  Environment.swift
//  CoinBase
//
//  Created by fin on 06/08/2025.
//
import Foundation 

enum AppConfig {
    
    private static let infoDict = Bundle.main.infoDictionary
    
    static let baseURL: String = {
        guard let baseURL = infoDict?["BASE_URL"] as? String else {
            fatalError("BASE_URL not found in Info.plist")
        }
        return "https://" + baseURL
    }()
    
    static let apiKey: String = {
        guard let apiKey = infoDict?["API_KEY"] as? String else {
            fatalError("API_KEY not found in Info.plist")
        }
        return apiKey
    }()
}
