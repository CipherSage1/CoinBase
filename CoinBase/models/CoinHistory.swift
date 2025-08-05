//
//  CoinHistory.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import Foundation

struct CoinHistoryData: Decodable {
    let change: String
    let history: [CoinHistoryItem]
}

struct CoinHistoryItem: Decodable {
    let price: String
    let timestamp: Int
    
    var priceValue: Double {
        Double(price) ?? 0.0
    }

    var date: Date {
        Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
}


enum TimePeriod: String, CaseIterable {
    case oneHour = "1h"
    case threeHours = "3h"
    case twelveHours = "12h"
    case twentyFourHours = "24h"
    case sevenDays = "7d"
    case thirtyDays = "30d"
    case threeMonths = "3m"
    case oneYear = "1y"
    case threeYears = "3y"
    case fiveYears = "5y"
}
