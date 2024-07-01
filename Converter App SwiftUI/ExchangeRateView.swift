//
//  ExchangeRateView.swift
//  Converter App SwiftUI
//
//  Created by Prasanth S on 21/05/24.
//

import Foundation
import SwiftUI


struct ExchangeRateView: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    var body: some View {
        HStack {
            Image(leftImage).resizable().frame(width: 30,height: 30)
            Text(text)
            Image(rightImage).resizable().frame(width: 30,height: 30)
        }
    }
}
#Preview {
    ExchangeRateView(leftImage: .silverpenny, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .copperpenny)
}
