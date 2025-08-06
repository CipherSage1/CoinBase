//
//  LoadingIndicator.swift
//  CoinBase
//
//  Created by fin on 06/08/2025.
//
import SwiftUI

struct LoadingIndicator: View {
    @State private var currentDot = 0
    private let dotCount = 3
    private let timer = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            // Dimmed background
            Color.black.opacity(0.3)
                .ignoresSafeArea()
            
            // The loading content
            HStack(spacing: 6) {
                Text("Loading")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                ForEach(0..<dotCount, id: \.self) { i in
                    Circle()
                        .frame(width: 6, height: 6)
                        .foregroundColor(.white)
                        .opacity(currentDot == i ? 1.0 : 0.3)
                        .animation(.easeInOut(duration: 0.3), value: currentDot)
                }
            }
            .padding(20)
            .background(Color.black.opacity(0.6))
            .cornerRadius(12)
        }
        .onReceive(timer) { _ in
            currentDot = (currentDot + 1) % dotCount
        }
    }
}
