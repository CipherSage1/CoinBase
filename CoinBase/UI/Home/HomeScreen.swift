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
    @State var offset: Int = 0
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                if let errorMessage = viewModel.errorMessage, !errorMessage.isEmpty {
                    ErrorPlaceHolder(errorMessage: errorMessage)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    TableView(
                        coins: viewModel.coins,
                        onCoinSelected: onCoinSelected,
                        onSwipeLeft: { coin in
                            viewModel.handleSaveFavourite(coin: coin.toCoinStore())
                        },
                        headerView: AnyView(
                            FilterComponent(
                                onPriceTap: {
                                    viewModel.onFilterByPrice(ascending: false)
                                },
                                onVolumeTap: {
                                    viewModel.onFilterByVolume(ascending: false)
                                }
                            )
                            .padding(.bottom, 8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        ),
                        footerView: AnyView(
                            Button(action: {
                                offset += 20
                                viewModel.fetchCoins(offset: offset)
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Load More")
                                        .foregroundColor(Color.appPrimary)
                                        .padding()
                                    Spacer()
                                }
                            }
                                .background(Color.clear)
                        )
                    )
                }
            }
            
            if viewModel.isLoading {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                LoadingIndicator()
            }
        }
    }
    
}
