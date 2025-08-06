//
//  HomeViewModel.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import Foundation
import Combine
import CoreData

class HomeViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    @Published var errorMessage: String? = nil
    
    
    private var cancellables = Set<AnyCancellable>()
    private let repository = NetworkRepository()
    
    private let viewContext: NSManagedObjectContext?
    
    init(viewContext: NSManagedObjectContext) {
           self.viewContext = viewContext
       }
    
    
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
    
    func handleSaveFavourite(coin: CoinStore) {
        guard let context = viewContext else {
            print("ViewContext not set.")
            return
        }

        // Optional: Check if already exists to avoid duplicates
        let fetchRequest: NSFetchRequest<CoinEntity> = CoinEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", coin.id)

        do {
            let results = try context.fetch(fetchRequest)
            if results.isEmpty {
                // Not in Core Data, save it
                let _ = CoinEntity.from(coin, context: context)
                try context.save()
                print("Favourite saved: \(coin.name)")
            } else {
                print("Coin already saved as favourite.")
            }
        } catch {
            print("Error saving favourite: \(error.localizedDescription)")
        }
    }
    
}
