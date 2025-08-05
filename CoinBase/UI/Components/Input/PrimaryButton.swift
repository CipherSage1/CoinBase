//
//  PrimaryButton.swift
//  CoinBase
//
//  Created by fin on 04/08/2025.
//

import SwiftUI


struct PrimaryButton: View {
    var title: String
    var icon: String? = nil // system icon name
    var height: CGFloat = 45 // ✅ Now height can be customized
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.bodySemiBold)
                
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.subheadline)
                }
            }
            .padding() 
            .frame(height: height) // ✅ Uses customizable height
            .background(Color.appPrimary)
            .cornerRadius(6)
            .foregroundColor(.appWhite)
        }
    }
}
