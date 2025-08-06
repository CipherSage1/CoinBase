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
    
    let filters = ["Price", "Volume"]
    
    @State private var selectedTimeRange: String? = nil
    
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
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(filters, id: \.self) { filter in
                        Button(action: {
                            selectedTimeRange = filter
                            if filter == "Price" {
                                onPriceTap()
                            } else {
                                onVolumeTap()
                            }
                        }) {
                            Text(filter)
                                .font(.caption)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background(
                                    selectedTimeRange == filter ?
                                    Color.appPrimary.opacity(0.8) : Color.gray.opacity(0.2)
                                )
                                .foregroundColor(
                                    selectedTimeRange == filter ? .white : .primary
                                )
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }.padding()
    }
}
