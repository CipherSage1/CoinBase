//
//  FilterComponent.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import SwiftUI

struct FilterComponent: View {
    
    let onPriceTap: () -> Void
    let onVolumeTap: () -> Void
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
           (Text("Welcome to, ")
                .font(.subTitleBold)
           +
            Text("CoinBase")
            .font(.subTitleBold)
            .foregroundColor(.appPrimary)
           ).padding(.top, 24)
            
            Text("Filter by: ")
                .font(.captionMedium)
                .foregroundColor(.appGrayText)
                .padding(.top, 6)
            
            HStack {
                PrimaryButton(title: "Price", height: 24, action: {
                    onPriceTap()
                })
                
                SecondaryButton(title: "Volume", height: 24, action: {
                    onVolumeTap()
                })
            }
        }.padding()
    }
}
