//
//  ContentView.swift
//  MoneyCalculatorApp
//
//  Created by 橋元雄太郎 on 2022/11/11.
//

import SwiftUI

struct ContentView: View {
    @State var editNum1 = 0
    @State var editNum2 = 0
    @State var editNum3 = 0
    @State var totalResult = 0
    @FocusState var isInputActive:Bool

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text("10000円")
                    TextField("Input Number", value: $editNum1, format: .number)
                        .frame(height: 20)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("\(additionAction(num: editNum1,moneyNum:10000))")
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text(" 5000円")
                    TextField("Input Number", value: $editNum2, format: .number)
                        .frame(height: 20)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("\(additionAction(num: editNum2,moneyNum: 5000))")
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text(" 1000円")
                    TextField("Input Number", value: $editNum3, format: .number)
                        .frame(height: 20)
                        .frame(width: 100)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("\(additionAction(num: editNum3,moneyNum: 1000))")
                    Spacer()
                }
                HStack {
                    Button(action: {
                        totalAdditionAction()
                    }) {
                        Text("合計をだす")
                    }
                    Text("\(totalResult)")
                }
            }
            .toolbar {
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
    }
    private func additionAction(num: Int,moneyNum: Int) -> Int {
        return num * moneyNum
    }
    private func totalAdditionAction() {
        totalResult = additionAction(num: editNum1, moneyNum: 10000) + additionAction(num: editNum2, moneyNum: 5000) + additionAction(num: editNum3, moneyNum: 1000)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
