//
//  SecondaryButton.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//

import SwiftUI

struct SecondaryButton: View {
    var title: String
    var icon: String? = nil // system icon name (e.g., "chevron.right")
    var height: CGFloat = 45 // ✅ Now height can be customized
    var action: () -> Void
    var isSystemIcon: Bool = true
   
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.bodySemiBold)
                
                if let icon = icon {
                    if isSystemIcon {
                        Image(systemName: icon)
                            .font(.subheadline)
                    } else {
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                    }
                }
            }
            .foregroundColor(.appBlack)
            .padding() 
            .frame(height: height)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.appBlack, lineWidth: 1)
            )
        }
    }
}
