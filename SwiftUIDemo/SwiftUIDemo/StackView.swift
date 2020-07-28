//
//  StackView.swift
//  SwiftUIDemo
//
//  Created by SeungWoo Mun on 2020/07/28.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        VStack() {
            VStack(alignment: .trailing) {
                Text("This is some text")
                Text("This is some longer text")
                Text("This is short")
                HStack(alignment: .lastTextBaseline, spacing: 20) {
                    Text("This is some text")
                        .font(.largeTitle)
                    Text("This is some longer text")
                        .font(.body)
                    Text("This is short")
                        .font(.headline)
                }
            }
            VStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width: 120, height: 50)
                Rectangle()
                    .foregroundColor(Color.red)
//                    .alignmentGuide(.leading, computeValue: {d in d.width / 3})
                    .alignmentGuide(.leading, computeValue: {
                        d in d[HorizontalAlignment.trailing] + 20
                    })
                    .frame(width: 200, height: 50)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: 180, height: 50)
            }
            HStack {
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width: 50, height: 200)
                Rectangle()
                    .foregroundColor(Color.red)
                    .frame(width: 50, height: 200)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: 50, height: 200)
                Rectangle()
                    .foregroundColor(Color.orange)
                    .frame(width: 50, height: 200)
            }
        }
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
