//
//  TotalAmountView.swift
//  MoneyCalculatorApp
//
//  Created by 橋元雄太郎 on 2022/11/17.
//

import SwiftUI

struct TotalAmountView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var totalText: Int
    @Binding var makeArray: [Int]


    var body: some View {
        VStack(spacing: 50) {
            Text("\(totalText)")
            List {
                ForEach(0 ..< makeArray.count, id: \.self) { index in
                    Text("\(makeArray[index])")
                }
            }
            Button(action: {
                dismiss()
            }) {
                Text("戻る")
            }
        }
    }
}

//struct TotalAmountView_Previews: PreviewProvider {
//    @State static var aaaaa:Int = 0
//        static var previews: some View {
//                TotalAmountView(totalText: $aaaaa)
//            }
//}
