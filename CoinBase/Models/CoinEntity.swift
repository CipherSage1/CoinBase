//
//  CoinEntity.swift
//  CoinBase
//
//  Created by fin on 05/08/2025.
//
import Foundation
import CoreData

extension CoinEntity {
    static func from(_ coin: CoinStore, context: NSManagedObjectContext) -> CoinEntity {
        let entity = CoinEntity(context: context)
        entity.id = coin.id
        entity.symbol = coin.symbol
        entity.name = coin.name
        entity.iconUrl = coin.iconUrl
        entity.volume24h = coin.volume24h
        entity.price = coin.price
        return entity
    }
}

extension CoinStore {
    init(entity: CoinEntity) {
        self.id = entity.id ?? ""
        self.symbol = entity.symbol ?? ""
        self.name = entity.name ?? ""
        self.iconUrl = entity.iconUrl
        self.volume24h = entity.volume24h
        self.price = entity.price
    }
}
