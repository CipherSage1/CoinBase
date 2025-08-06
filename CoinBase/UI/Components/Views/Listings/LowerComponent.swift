//
//  LowerComponent.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import SwiftUI

public struct LowerComponent: View {
    
    let colorHex: String?
    let historyItems: [CoinHistoryItem]
    let timeRangeOptions: [TimePeriod] = [.oneHour, .threeHours, .twelveHours, .twentyFourHours, .sevenDays, .thirtyDays, .threeMonths, .oneYear, .threeYears, .fiveYears]
    
    @State private var selectedTimeRange: TimePeriod = .oneYear
    
    var onTimeRangeSelected: ((TimePeriod) -> Void)
    
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading) {
                Text("Performance History")
                    .font(.bodyBold)
                
                Text("Select a time range to view performance history.")
                    .font(.captionMedium)
                    .foregroundColor(Color.appLightGrayText)
            }
            
            // Time Range Buttons
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(timeRangeOptions, id: \.self) { option in
                        Button(action: {
                            selectedTimeRange = option
                            onTimeRangeSelected(option)
                        }) {
                            Text(option.rawValue)
                                .font(.caption)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background(
                                    selectedTimeRange == option ?
                                    Color.blue.opacity(0.8) : Color.gray.opacity(0.2)
                                )
                                .foregroundColor(
                                    selectedTimeRange == option ? .white : .primary
                                )
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            // Chart
            CoinHistoryChartView(
                historyItems: historyItems,
                colorHex: colorHex
            )
        }
        .padding(.top, 16)
    }
}
