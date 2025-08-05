//
//  ListingViewModel.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import Foundation
import Combine

class ListingViewModel: ObservableObject {
    
    @Published var listingDetails: Coin? = nil
    @Published var coinHistory: [CoinHistoryItem] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let repository = NetworkRepository()
    
    func fetchListingDetails(coinUUID: String) {
        repository.getCoinById(coinUUID: coinUUID)
            .receive(on: DispatchQueue.main) // ✅ ensure UI updates on main thread
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] coin in
                self?.listingDetails = coin
            })
            .store(in: &cancellables)
    }
    
    
    func fetchCoinHistory(coinUUID: String, timePeriod: TimePeriod? = .oneYear) {
        repository.getCoinHistory(coinUUID: coinUUID, timePeriod: timePeriod ?? .oneYear)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] coinHistoryItem in 
                self?.coinHistory = coinHistoryItem
            })
            .store(in: &cancellables)
    }

    
}
