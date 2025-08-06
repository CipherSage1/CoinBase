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
        fetchFavourites()
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
            self.coins = []
        }
    }
    
    
    func deleteFavourite(id: String) {
        guard let context = viewContext else {
            print("ViewContext not set.")
            return
        }

        let fetchRequest: NSFetchRequest<CoinEntity> = CoinEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)

        do {
            let results = try context.fetch(fetchRequest)
            if let coinToDelete = results.first {
                context.delete(coinToDelete)
                try context.save() // Save deletion
                print("Deleted coin with id: \(id)")
                fetchFavourites()
            } else {
                print("Coin with id \(id) not found.")
            }
        } catch {
            print("Failed to delete coin: \(error.localizedDescription)")
        }
    }

}
