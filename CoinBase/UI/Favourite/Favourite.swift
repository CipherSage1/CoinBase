//
//  Favourite.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import SwiftUI 

struct Favourite: View {
    
    @ObservedObject var viewModel: FavouriteViewModel
    var onCoinSelected: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if viewModel.coins.isEmpty {
                EmptyListPlaceholder()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                TableView(
                    coins: viewModel.coins.map { $0.toCoin() },
                    onCoinSelected: onCoinSelected,
                    onSwipeLeft: { coin in
                        viewModel.deleteFavourite(id: coin.id)
                    },
                    headerView: AnyView(
                        FavouriteHeader()
                            .padding(.bottom, 8)
                            .padding(.top, 24)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    ),
                    isFavourite: true
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }.onAppear {
            viewModel.fetchFavourites()
        }
    }
}

