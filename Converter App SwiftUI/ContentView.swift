//
//  ContentView.swift
//  Converter App SwiftUI
//
//  Created by Prasanth S on 13/05/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showInfo: Bool = false
    @State var showCurrencyView: Bool = false
    @State var leftTextData = ""
    @State var rightTextData = ""
    @State var leftCurrency: CurrencyModel = UserDefaults.standard.codable(forKey: "top") ?? .silverPiece
    @State var rightCurrency: CurrencyModel = UserDefaults.standard.codable(forKey: "bottom") ?? .goldPiece
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    var body: some View {
        ZStack {
            //Background
            Image(.images)
                .resizable().scaledToFill()
                .ignoresSafeArea()
            VStack {
                Image(.logo1)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200).cornerRadius(10)
                Text("Currency Converter").font(.largeTitle).bold().foregroundStyle(.green)
                HStack {
                    
                    VStack {
                        
                        HStack {
                            if let topCurrency = UserDefaults.standard.object(forKey: "top") as? CurrencyModel {
                                Image(topCurrency.image).resizable().scaledToFit().frame(width: 50,height: 50)
                                Text(topCurrency.currencyName).foregroundStyle(.black)
                            } else {
                                Image(leftCurrency.image).resizable().scaledToFit().frame(width: 50,height: 50)
                                Text(leftCurrency.currencyName).foregroundStyle(.black)
                            }
                            
                        }
                        .onTapGesture {
                            showCurrencyView.toggle()
                            print("Left Tapped")
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        TextField("Amount", text: $leftTextData).textFieldStyle(.roundedBorder).frame(width: 150).multilineTextAlignment(.center).focused($leftTyping)
                            .onChange(of: leftTextData){
                            if leftTyping {
                                rightTextData = leftCurrency.convertCurrency(amountStr: leftTextData, toCurrency: rightCurrency)
                            }
                        }
                        
                        
                    }
                    Image(systemName: "equal").font(.largeTitle)
                    VStack{
                        
                        HStack{
                            if let bottomCurrency = UserDefaults.standard.object(forKey: "bottom") as? CurrencyModel {
                                Image(bottomCurrency.image).resizable().scaledToFit().frame(width: 50,height: 50)
                                Text(bottomCurrency.currencyName).foregroundStyle(.black)
                            } else {
                                Image(rightCurrency.image).resizable().scaledToFit().frame(width: 50,height: 50)
                                Text(rightCurrency.currencyName).foregroundStyle(.black)
                            }
                        }.onTapGesture {
                            showCurrencyView.toggle()
                            print("Right tapped")
                        }
                        TextField("Amount", text: $rightTextData)
                        {
                            UIApplication.shared.endEditing()
                        }.textFieldStyle(.roundedBorder).frame(width: 150).multilineTextAlignment(.center).focused($rightTyping)
                            .onChange(of: rightTextData) {
                                
                                if rightTyping {
                                    leftTextData = rightCurrency.convertCurrency(amountStr: rightTextData, toCurrency: leftCurrency)
                                }
                        }
                    }
                }
                
                .padding().background(.blue.opacity(0.5)).cornerRadius(10)
                Spacer()
                HStack {
                    Button {
                        showInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill").font(.largeTitle).foregroundColor(.green)
                    }.sheet(isPresented: $showInfo, content: {
                        InfoView()
                    })
                }
            }
            .task {
                try? Tips.configure()
            }
            .onChange(of: leftCurrency, {
                rightTextData = leftCurrency.convertCurrency(amountStr: leftTextData, toCurrency: rightCurrency)
            })
            .onChange(of: rightCurrency, {
                leftTextData = rightCurrency.convertCurrency(amountStr: rightTextData, toCurrency: leftCurrency)
            })
            .sheet(isPresented: $showCurrencyView, content: {
                SelectCurrencyView(topCurrency: $leftCurrency,bottomCurrency: $rightCurrency)
            })
        }
    }
}

#Preview {
    ContentView()
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
