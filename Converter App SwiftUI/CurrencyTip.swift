//
//  CurrencyTip.swift
//  Converter App SwiftUI
//
//  Created by Prasanth S on 04/06/24.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    let title = Text("Change Currency")
    let message: Text? = Text("Tap the currency icon to open the Chanhe currency screen")
}
