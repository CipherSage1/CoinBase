//
//  SparklineChartView.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import SwiftUI
import Charts

struct SparklineChartView: View {
    let sparkline: [Double]
    let colorHex: String?
    
    struct SparklinePoint: Identifiable {
        let id = UUID()
        let index: Int
        let price: Double
    }
    
    var dataPoints: [SparklinePoint] {
        sparkline.enumerated().map { SparklinePoint(index: $0.offset, price: $0.element) }
    }
    
    var body: some View {
        
        let chartColor = Color(hex: colorHex ?? "") ?? .appAccent
        
        Chart(dataPoints) { point in
            AreaMark(
                x: .value("Index", point.index),
                y: .value("Price", point.price)
            )
            .foregroundStyle(
                .linearGradient(
                    Gradient(colors: [chartColor.opacity(0.6), .clear]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            PointMark(
                x: .value("Index", point.index),
                y: .value("Price", point.price)
            )
            .symbolSize(6)
            .foregroundStyle(Color.appPrimary)
        }
        .frame(height: 100)
    }
}
