//
//  MainNavigation.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//

import SwiftUI

struct MainNavigation: View {
    
    @State private var selectedCoinId: String? = nil
    
    var body: some View {
        
        NavigationStack {
            TabView {
                HomeScreen(viewModel: HomeViewModel(), onCoinSelected: { coinId in
                    print("SelectedCoinId: \(coinId)")
                    self.selectedCoinId = coinId
                })
                .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                Favourite(
                    onCoinSelected: { coinId in
                        print("SelectedCoinId: \(coinId)")
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
                    ListingDetails(
                        viewModel: {
                            let vm = ListingViewModel()
                            vm.fetchListingDetails(coinUUID: id)
                            vm.fetchCoinHistory(coinUUID: id)
                            return vm
                    }())
                }
            })
        }
        
        
    }
}
