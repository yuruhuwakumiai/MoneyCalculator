//
//  ContentView.swift
//  MoneyCalculatorApp
//
//  Created by 橋元雄太郎 on 2022/11/11.
//

import SwiftUI

struct Money {
    var amount = 0
    var count = 0
}

struct ContentView: View {

    @FocusState  var isActive:Bool

    @State var toTotalAmount = false
    @State var toInfo = false
    @State var totalText = 0
    @State var moneyArray: [Money] = []
    @State private var makeArray: [Int] = []
    private let firstMoneyData = [
        Money(amount: 10000),
        Money(amount: 5000),
        Money(amount: 1000),
        Money(amount: 500),
        Money(amount: 100),
        Money(amount: 50),
        Money(amount: 10),
    ]

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0..<moneyArray.count, id: \.self) { index in
                        HStack {
                            Text("\(moneyArray[index].amount)円")
                                .frame(width: UIScreen.main.bounds.width/5, alignment: .trailing)
                            TextField("", value: $moneyArray[index].count, format: .number)
                                .frame(maxWidth: .infinity)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .focused($isActive)
                            Text("\(moneyArray[index].count * moneyArray[index].amount)")
                        }
                    }
                    HStack {
                        Spacer()
                        Text("\(totalText)")
                            .font(.largeTitle)
                        Spacer()
                    }
                }
                VStack(spacing: 30) {
                    Button(action: {
                        totalAdditionAction()
                        self.makeArray.append(self.totalText )
                    }) {
                        Text("計算ボタン")
                    }
                    Button(action: {
                        clearButtonAction()
                    }) {
                        Text("クリア")
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()         // 右寄せにする
                    Button("閉じる") {
                        isActive = false  //  フォーカスを外す
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                    } label: {
                        Text("編集")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        toTotalAmount = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("金種明細計算機")
            .onAppear {
                moneyArray = firstMoneyData
            }
        }
        .fullScreenCover(isPresented: $toTotalAmount) {
            TotalAmountView(totalText: $totalText,makeArray: $makeArray)
        }
    }

    private func totalAdditionAction() -> Int {
        moneyArray.forEach {
            totalText += $0.amount * $0.count
        }
        return totalText
    }

    private func clearButtonAction() {
        totalText = 0
        moneyArray = firstMoneyData
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
