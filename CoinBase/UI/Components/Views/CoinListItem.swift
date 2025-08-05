//
//  CoinListItem.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import SwiftUI

struct CoinListItem: View {
    
    var coin: Coin
    
    var body: some View {
        HStack {
            ZStack {
                // Fixed space for image
                if let urlString = coin.iconUrl, let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    } placeholder: {
                        // While loading, show a placeholder icon
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                    }
                } else {
                    // When no image URL or failed, show broken image icon
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                        .frame(width: 40, height: 40)
                }
            }
            
            VStack(alignment: .leading) {
                Text(coin.symbol)
                    .font(.subTitleBold)
                
                Text("\(coin.name)")
                    .font(.captionMedium)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(formattedPrice(coin.price))
                    .font(.bodySemiBold)
                
                Text("\(coin.volume24h ?? "Unavailable")")
                    .font(.captionMedium)
            }
        }.frame(height: 60)
    }
}
