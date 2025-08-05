//
//  UpperComponent.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//

import SwiftUI


struct UpperComponent: View {
    
    var coinData: Coin?
    
    var body: some View {
        VStack(alignment: .center) {
            if let urlString = coinData?.iconUrl, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                }
                .scaledToFit()
                .frame(width: 100, height: 100)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            
            VStack {
                Text(coinData?.description ?? "Loading...")
                    .font(.bodyRegular)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity)
            }.padding(.vertical)
            
            VStack{
                HStack{
                    Text("Name")
                        .font(.captionBold)
                    Spacer()
                    Text(coinData?.name ?? "Loading...")
                        .font(.captionMedium)
                }.padding(.top, 3)
                
                HStack{
                    Text("Price")
                        .font(.captionBold)
                    Spacer()
                    Text(coinData?.price ?? "Loading...")
                        .font(.captionMedium)
                }.padding(.top, 3)
                
                HStack{
                    Text("symbol")
                        .font(.captionBold)
                    Spacer()
                    Text(coinData?.symbol ?? "Loading...")
                        .font(.captionMedium)
                }.padding(.top, 3)
                
                
                HStack{
                    Text("Rank")
                        .font(.captionBold)
                    Spacer()
                    
                    if let rank = coinData?.rank {
                        Text("\(rank)")
                            .font(.captionMedium)
                    } else {
                        Text("Loading...")
                            .font(.captionMedium)
                    }
                }.padding(.top, 3)
                
                
                HStack{
                    Text("24hVolume")
                        .font(.captionBold)
                    Spacer()
                    Text(coinData?.volume24h ?? "Loading...")
                        .font(.captionMedium)
                }.padding(.top, 3)
                
                HStack{
                    Text("marketCap")
                        .font(.captionBold)
                    Spacer()
                    Text(coinData?.marketCap ?? "Loading...")
                        .font(.captionMedium)
                }.padding(.top, 3)
                
                
                HStack{
                    Text("Website")
                        .font(.captionBold)
                    Spacer()
                    Text(coinData?.coinrankingUrl ?? "Loading...")
                          .font(.captionMedium)
                          .multilineTextAlignment(.trailing)
                          .lineLimit(nil) // Allows unlimited lines
                          .fixedSize(horizontal: false, vertical: true) // Prevent truncation
                }.padding(.vertical)
            }

        }
    }
}
