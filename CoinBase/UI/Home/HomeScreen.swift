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
        
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Top filter section
                FilterComponent(
                    onPriceTap:{
                        viewModel.onFilterByPrice(ascending: false)
                    },
                    onVolumeTap:{
                        viewModel.onFilterByVolume(ascending: false)
                    }
                )
                
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.coins.indices, id: \.self) { index in
                        let coin = viewModel.coins[index]
                        
                        Button(action: {
                            onCoinSelected(coin.uuid)
                        }) {
                            
                            SwipeableRow(content: {
                                CoinListItem(coin: coin)
                                    .padding(.horizontal)
                                
                            }, onSwipeLeft: {
                                print("Swiped on \(coin.name)")
                            })
                            
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        
                        // Add a divider unless it's the last item
                        if index < viewModel.coins.count - 1 {
                            Divider()
                                .padding(.leading, 60) // offset divider if image width is ~40
                        }
                        
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchCoins()
        }
    }
}

