//
//  MidComponent.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import SwiftUI

struct MidComponent: View {
    
    let sparkline: [Double]
    let colorHex: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Spark Line Performance History")
                .font(.bodyBold)
                .padding(.vertical)
            
            SparklineChartView(
                sparkline: sparkline,
                colorHex: colorHex
            )
        }
        .padding(.vertical)
    }
}
