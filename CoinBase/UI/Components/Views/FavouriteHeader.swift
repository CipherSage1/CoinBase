//
//  FavouriteHeader.swift
//  CoinBase
//
//  Created by fin on 05/08/2025.
//
import SwiftUI

struct FavouriteHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            (
                Text("My favourite ")
                    .font(.headingMedium)
                +
                Text("coins")
                    .font(.headingMedium)
                    .foregroundColor(Color.appSecondary)
            )

            Text("Swipe left to remove coin from favourite")
                .font(.captionMedium)
                .foregroundColor(Color.appGrayText)
        }
        .padding(.vertical, 16)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
