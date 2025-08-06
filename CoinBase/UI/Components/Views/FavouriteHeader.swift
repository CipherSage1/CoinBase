//
//  FavouriteHeader.swift
//  CoinBase
//
//  Created by fin on 05/08/2025.
//
import SwiftUI

struct FavouriteHeader: View {
    
    var body: some View {
        VStack{
           (
            Text("My Favourite")
                .font(.headingMedium)
           +
             Text("Coins")
                  .font(.headingMedium)
                  .foregroundColor(Color.appSecondary)
           )
            
            Text("Swipe left to remove coin from favourite")
                .font(.bodyMedium)
                .foregroundColor(Color.appGrayText)
                .padding(.top, 16)
            
        }.background(Color.secondary)
    }
}
