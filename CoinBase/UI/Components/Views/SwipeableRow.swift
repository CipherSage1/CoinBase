//
//  SwipeableRow.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//
import SwiftUI


struct SwipeableRow<Content: View>: View {
    let content: () -> Content
    let onSwipeLeft: () -> Void

    @State private var offset: CGFloat = 0

    var body: some View {
        ZStack(alignment: .trailing) {
            // Background action button
            HStack {
                Spacer()
                Button(action: onSwipeLeft) {
                    Image(systemName: "heart")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.appSecondary)
                        .cornerRadius(6) // Slightly rounded square
                }
                .frame(width: 50, height: 50)
                .padding(.trailing, 16)
            }

            // Foreground swipeable content
            content()
                .background(Color.white)
                .offset(x: offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            // Only allow horizontal swipes
                            if abs(value.translation.width) > abs(value.translation.height) {
                                if value.translation.width < 0 {
                                    offset = value.translation.width
                                }
                            }
                        }
                        .onEnded { value in
                            offset = value.translation.width < -80 ? -80 : 0
                        }
                )
                .animation(.spring(), value: offset)
        }
        .frame(height: 70) // Unified consistent height
    }
}
