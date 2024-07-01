//
//  CoinView.swift
//  Converter App SwiftUI
//
//  Created by Prasanth S on 23/05/24.
//

import SwiftUI

struct CoinView: View {
    let currencyImage: ImageResource
    let currencyName: String
    var body: some View {
        ZStack(alignment: .bottom){
            Image(currencyImage).resizable().scaledToFit()
            
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100,height: 100).background(Color.brown)
        .clipShape(.rect(cornerRadius: 25))

    }
}

#Preview {
    CoinView(currencyImage: .bitCoin, currencyName: "BitCoin")
}
