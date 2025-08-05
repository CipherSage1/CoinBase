//
//  Response.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//

struct Response<T: Decodable>: Decodable {
    let data: T
}

struct CoinDetails: Decodable {
    let coin: Coin
}

struct Coin: Codable, Identifiable {
    var id: String { uuid }

    let uuid: String
    let symbol: String
    let name: String
    let description: String?
    let color: String?
    let iconUrl: String?
    let websiteUrl: String?
    let links: [Link]?
    let supply: Supply?
    let numberOfMarkets: Int?
    let numberOfExchanges: Int?
    let volume24h: String?
    let marketCap: String?
    let fullyDilutedMarketCap: String?
    let price: String?
    let btcPrice: String?
    let priceAt: Int?
    let change: String?
    let rank: Int?
    let sparkline: [String?]?
    let allTimeHigh: AllTimeHigh?
    let coinrankingUrl: String?
    let tier: Int?
    let lowVolume: Bool?
    let listedAt: Int?
    let hasContent: Bool?
    let notices: String? // Could be [String] or something else if format is clarified
    let contractAddresses: [String]?
    let tags: [String]?
    let isWrappedTrustless: Bool?
    let wrappedTo: String?

    enum CodingKeys: String, CodingKey {
        case uuid, symbol, name, description, color, iconUrl, websiteUrl, links, supply
        case numberOfMarkets, numberOfExchanges
        case volume24h = "24hVolume"
        case marketCap, fullyDilutedMarketCap, price, btcPrice, priceAt
        case change, rank, sparkline, allTimeHigh, coinrankingUrl, tier
        case lowVolume, listedAt, hasContent, notices, contractAddresses, tags
        case isWrappedTrustless, wrappedTo
    }
}

struct Link: Codable {
    let name: String
    let url: String
    let type: String
}

struct Supply: Codable {
    let confirmed: Bool?
    let supplyAt: Int?
    let max: String?
    let total: String?
    let circulating: String?
}

struct AllTimeHigh: Codable {
    let price: String?
    let timestamp: Int?
}



struct CoinData: Decodable {
    let stats: Stats
    let coins: [Coin]
}

struct Stats: Codable {
    let total: Int
    let totalCoins: Int
    let totalMarkets: Int
    let totalExchanges: Int
    let totalMarketCap: String
    let total24hVolume: String
}
