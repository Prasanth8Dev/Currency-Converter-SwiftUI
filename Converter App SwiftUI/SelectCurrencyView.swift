//
//  SelectCurrencyView.swift
//  Converter App SwiftUI
//
//  Created by Prasanth S on 23/05/24.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: CurrencyModel
    @Binding var bottomCurrency: CurrencyModel
    
    var body: some View {
        ZStack {
            Image(.parchment).resizable().ignoresSafeArea().background(Color.brown)
            VStack {
                Text("Select the Currency you are starting with:").fontWeight(.bold)
                IconGrid(currency: $topCurrency)

                Text("Select the Currency you would like to convert to:").fontWeight(.bold)
                IconGrid(currency: $bottomCurrency)
                
                
                Button("Done") {
                    UserDefaults.standard.setCodable(topCurrency, forKey: "top")
                    UserDefaults.standard.setCodable(bottomCurrency, forKey: "bottom")
                    dismiss()
                }.buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
               
            }
        }
    }
}

#Preview {
    SelectCurrencyView(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPenny))
}

extension UserDefaults {
    func setCodable<T: Codable>(_ value: T, forKey key: String) {
        if let encoded = try? JSONEncoder().encode(value) {
            self.set(encoded, forKey: key)
        }
    }
    
    func codable<T: Codable>(forKey key: String) -> T? {
        if let data = self.data(forKey: key),
           let decoded = try? JSONDecoder().decode(T.self, from: data) {
            return decoded
        }
        return nil
    }
}
