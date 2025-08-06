//
//  ErrorPlaceHolder.swift
//  CoinBase
//
//  Created by fin on 06/08/2025.
//

import SwiftUI

struct ErrorPlaceHolder: View {
    
    let errorMessage: String
    
    var body: some View {
        VStack {
            Image("error_occured")
                .resizable()
                .scaledToFit()
                .padding(.bottom, 16)
                .padding(.top, 16)
                .frame(width: 215, height: 215, alignment: .center)
            
            Text("\(errorMessage)!")
                .font(.bodyBold)
                .foregroundColor(Color.danger)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
