//
//  IconGrid.swift
//  Converter App SwiftUI
//
//  Created by Prasanth S on 29/05/24.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: CurrencyModel
    var body: some View {
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()], content: {
            ForEach(CurrencyModel.allCases) { currencyData in
                if currencyData == currency {
                    CoinView(currencyImage: currencyData.image, currencyName: currencyData.currencyName).shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 3).opacity(0.3)
                        }
                } else {
                    CoinView(currencyImage: currencyData.image, currencyName: currencyData.currencyName).onTapGesture {
                        currency = currencyData
                    }
                }
               
            }
            //CoinView(currencyImage: .copperpenny, currencyName: "Copper Penny")
        }).padding()

    }
}

#Preview {
    IconGrid(currency: .constant(.silverPenny))
}
