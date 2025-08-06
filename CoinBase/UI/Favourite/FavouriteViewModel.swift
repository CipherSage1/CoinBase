//
//  FavouriteViewModel.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import Foundation
import Combine
import CoreData

class FavouriteViewModel: ObservableObject {
    
    @Published var coins: [CoinStore] = []
    
    private let viewContext: NSManagedObjectContext?
    
    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
        fetchFavourites() // Optionally auto-fetch on init
    }
    
    func fetchFavourites() {
        guard let context = viewContext else {
            print("ViewContext not set.")
            return
        }

        let fetchRequest: NSFetchRequest<CoinEntity> = CoinEntity.fetchRequest()

        do {
            let results = try context.fetch(fetchRequest)
            self.coins = results.map { CoinStore(entity: $0) }
            print("Fetched \(coins.count) favourite coins.")
        } catch {
            print("Error fetching favourites: \(error.localizedDescription)")
            self.coins = [] // Optional: clear on failure
        }
    }
}
