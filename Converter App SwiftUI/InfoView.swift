//
//  InfoView.swift
//  Converter App SwiftUI
//
//  Created by Prasanth S on 20/05/24.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) var goBack
    var body: some View {
        ZStack {
            Image(uiImage: .bg2).resizable().ignoresSafeArea()
            VStack {
                Text("Exchange Rates").font(.largeTitle)
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:").padding(.leading).padding(.trailing)
                ExchangeRateView(leftImage: .gold, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .silver)
                ExchangeRateView(leftImage: .bitCoin, text: "1 Gold = 4 Silver Pieces", rightImage: .silver)
                ExchangeRateView(leftImage: .silver, text: "1 Silver = 4 Silver Pennies", rightImage: .gold)
                
                HStack {
                    
                }
                Button("Done") {
                    goBack()
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
            }.foregroundColor(.black) //Change the text color when darkmode enabled
           

            
//
            
            
        }
        
    }
}

#Preview {
    InfoView()
}

//struct ExtractedView: View {
//    var body: some View {
//        HStack {
//            Image(.bitCoin).resizable().frame(width: 30,height: 30)
//            Text("1 Gold Piece")
//            Text("=")
//            Text("4 Gold Pennies")
//            Image(.silver).resizable().frame(width: 30,height: 30)
//        }
//    }
//}
//#Preview {
//    ExtractedView()
//}
