//
//  HomeScreen.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var onCoinSelected: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TableView(coins: viewModel.coins, onCoinSelected: onCoinSelected, onSwipeLeft: { coin in
                viewModel.handleSaveFavourite(coin: coin.toCoinStore())
            },
                      headerView: AnyView(
                        FilterComponent(
                            onPriceTap:{
                                viewModel.onFilterByPrice(ascending: false)
                            },
                            onVolumeTap:{
                                viewModel.onFilterByVolume(ascending: false)
                            }
                        ).padding(.bottom, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                      )
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            if viewModel.coins.isEmpty {
                viewModel.fetchCoins()
            }
        }
    }
}
