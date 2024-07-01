//
//  CurrencyModel.swift
//  Converter App SwiftUI
//
//  Created by Prasanth S on 24/05/24.
//

import Foundation
import SwiftUI

enum CurrencyModel: Double, CaseIterable, Identifiable,Codable {
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    case diamond = 8888
    
    
    //Computed Property
    var id: CurrencyModel { self }
   // var id: Double { rawValue } Method 2 for computed properties
    
    var image: ImageResource {
        switch self {
        case.copperPenny:
                .copperpenny
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .diamond:
                .diamond
        }
    }
    
    var currencyName: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        case .silverPiece:
            "Silver Piece"
        case .diamond:
            "Diamond"
        }
    }
    
    func convertCurrency(amountStr: String, toCurrency: CurrencyModel) -> String {
        guard let amount = Double(amountStr) else {
            return ""
        }
        let convertedAmount = amount / self.rawValue * toCurrency.rawValue
        return String(format: "%.2f", convertedAmount)
    }
}
