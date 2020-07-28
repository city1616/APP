//
//  StackView3.swift
//  SwiftUIDemo
//
//  Created by SeungWoo Mun on 2020/07/28.
//

import SwiftUI

struct StackView3: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 100, height: 100)
            Capsule()
                .frame(width: 100, height: 100)
            Circle()
                .frame(width: 100, height: 100)
        }
    }
}

struct StackView3_Previews: PreviewProvider {
    static var previews: some View {
        StackView3()
    }
}
