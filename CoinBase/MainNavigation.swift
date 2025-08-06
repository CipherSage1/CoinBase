//
//  MainNavigation.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//

import SwiftUI
import CoreData

struct MainNavigation: View {
    
    @State private var selectedCoinId: String? = nil
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dataController: DataController
    @StateObject private var homeViewModel: HomeViewModel
    @StateObject private var favouriteViewModel: FavouriteViewModel

    init(viewContext: NSManagedObjectContext) {
        _homeViewModel = StateObject(wrappedValue: HomeViewModel(viewContext: viewContext))
        _favouriteViewModel = StateObject(wrappedValue: FavouriteViewModel(viewContext: viewContext))
    }
    
    var body: some View {
        
        NavigationStack {
            TabView {
                HomeScreen(
                    viewModel: homeViewModel,
                    onCoinSelected: { coinId in
                    self.selectedCoinId = coinId
                })
                .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                Favourite(
                    viewModel: favouriteViewModel,
                    onCoinSelected: { coinId in
                        self.selectedCoinId = coinId
                    }
                )
                .tabItem {
                     Label("Favourites", systemImage: "heart")
                }
            }
            .navigationDestination(isPresented: Binding(
                get: { selectedCoinId != nil },
                set: { if !$0 { selectedCoinId = nil } }
            ), destination: {
                if let id = selectedCoinId {
                    ListingDetails(coinUUID: id)
                }
            })
        }
        
    }
}
