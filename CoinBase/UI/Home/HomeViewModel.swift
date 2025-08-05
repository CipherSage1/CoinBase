//
//  HomeViewModel.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private let repository = NetworkRepository()
    
    func fetchCoins() {
        repository.getAllCoins()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { coins in
                self.coins = coins
            }
            .store(in: &cancellables)
    }
    
    func onFilterByPrice(ascending: Bool) {
        coins.sort { (coin1: Coin, coin2: Coin) -> Bool in
            let price1 = Double(coin1.price ?? "") ?? 0
            let price2 = Double(coin2.price ?? "") ?? 0
            return ascending ? price1 < price2 : price1 > price2
        }
    }
    
    func onFilterByVolume(ascending: Bool) {
        coins.sort { (coin1: Coin, coin2: Coin) -> Bool in
            let vol1 = Double(coin1.volume24h ?? "") ?? 0
            let vol2 = Double(coin2.volume24h ?? "") ?? 0
            return ascending ? vol1 < vol2 : vol1 > vol2
        }
    }
}
