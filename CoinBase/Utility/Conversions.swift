//
//  Conversions.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import Foundation

func formattedPrice(_ price: String?) -> String {
    guard let price = price, let doubleValue = Double(price) else {
        return "Unavailable"
    }

    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencySymbol = "$"
    formatter.maximumFractionDigits = 2
    formatter.minimumFractionDigits = 2

    return formatter.string(from: NSNumber(value: doubleValue)) ?? "Unavailable"
}
