//
//  ListingDetails.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import SwiftUI

struct ListingDetails: View {
    
    let coinUUID: String
    @StateObject private var viewModel = ListingViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                UpperComponent(
                    coinData: viewModel.listingDetails
                )
                .frame(minHeight: 400) // Adjust this value to occupy "most" of the screen
                .frame(maxWidth: .infinity)
                .layoutPriority(1)
                
                MidComponent(
                    sparkline: (viewModel.listingDetails?.sparkline ?? [])
                        .compactMap { $0 }
                        .compactMap { Double($0) },
                    colorHex: viewModel.listingDetails?.color
                )
                
                LowerComponent(
                    colorHex: viewModel.listingDetails?.color,
                    historyItems: viewModel.coinHistory) { timePeriod in
                        viewModel.fetchCoinHistory(coinUUID: viewModel.listingDetails?.uuid ?? "", timePeriod: timePeriod)
                    }
                
                Spacer(minLength: 30)
            }
            .padding()
        }
        .navigationTitle(viewModel.listingDetails?.name ?? "Details")
        .onAppear {
            viewModel.fetchListingDetails(coinUUID: coinUUID)
            viewModel.fetchCoinHistory(coinUUID: coinUUID)
        }
    }
}
