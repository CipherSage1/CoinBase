//
//  CoinHistoryChartView.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import SwiftUI
import Charts

struct CoinHistoryChartView: View {
    let historyItems: [CoinHistoryItem]
    let colorHex: String?

    var body: some View {
        let chartColor = Color(hex: colorHex ?? "") ?? .appSecondary
        
        Chart {
            ForEach(historyItems, id: \.timestamp) { item in
                LineMark(
                    x: .value("Time", item.date),
                    y: .value("Price", item.priceValue)
                )
                .foregroundStyle(chartColor)
                
                AreaMark(
                    x: .value("Time", item.date),
                    y: .value("Price", item.priceValue)
                )
                .foregroundStyle(
                    .linearGradient(
                        Gradient(colors: [chartColor.opacity(0.4), .clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
        }
        .frame(height: 200)
    }
}
