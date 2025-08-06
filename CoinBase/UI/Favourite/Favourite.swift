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
            
            TableView(
                coins: viewModel.coins.map { $0.toCoin() }, onCoinSelected: { coidId in
                    print("Coin is selected \(coidId)")
                }, onSwipeLeft: { coin in
                    print("Coin selected \(coin)")
                },
                headerView: AnyView(
                    FavouriteHeader().padding(.bottom, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                )
            ).frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
    }
    
}
