//
//  TotalAmountView.swift
//  MoneyCalculatorApp
//
//  Created by 橋元雄太郎 on 2022/11/17.
//

import SwiftUI

struct TotalAmountView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 50) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button(action: {
                dismiss()
            }) {
                Text("戻る")
            }
        }
    }
}

struct TotalAmountView_Previews: PreviewProvider {
    static var previews: some View {
        TotalAmountView()
    }
}
