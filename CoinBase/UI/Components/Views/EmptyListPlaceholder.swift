//
//  EmptyListPlaceholder.swift
//  CoinBase
//
//  Created by fin on 06/08/2025.
//
import SwiftUI

struct EmptyListPlaceholder: View {
    var body: some View {
        VStack{
            Image("empty_file_illustrator")
                .resizable()
                .scaledToFit()
                .padding(.bottom, 16)
                .padding(.top, 16)
                .frame(width: 215, height: 215, alignment: .center)
            
            Text("No favourite coins found!")
                .font(.bodyBold)
                .foregroundColor(Color.appLightGrayText)
        }
    }
}
