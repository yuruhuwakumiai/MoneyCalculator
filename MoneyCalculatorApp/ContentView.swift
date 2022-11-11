//
//  ContentView.swift
//  MoneyCalculatorApp
//
//  Created by 橋元雄太郎 on 2022/11/11.
//

import SwiftUI

struct ContentView: View {
    @State var inputText1: String = ""
    @State var inputText2: String = ""
    @State var inputText3: String = ""
    @State var resultText1: String = ""
    @State var resultText2: String = ""
    @FocusState var isInputActive:Bool

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("10000円")
                    TextField("枚数入力", text: $inputText1)
                        .frame(height: 20)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text(resultText1)
                }
                HStack {
                    Text("5000円")
                    TextField("枚数入力", text: $inputText1)
                        .frame(height: 20)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text(resultText2)
                }
            }
            .toolbar {                   // ツールバーを親の一番上の要素に実装
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()  // 右寄せにする
                    Button("Done") {
                        isInputActive = false
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("金種明細計算機")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
