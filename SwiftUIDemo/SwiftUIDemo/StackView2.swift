//
//  StackView2.swift
//  SwiftUIDemo
//
//  Created by SeungWoo Mun on 2020/07/28.
//

import SwiftUI

struct StackView2: View {
    var body: some View {
        HStack(alignment: .crossAlignment, spacing: 20) {
            Circle()
                .foregroundColor(Color.purple)
                .alignmentGuide(.crossAlignment, computeValue: {d in d[VerticalAlignment.center]})
                .frame(width: 100, height: 100)
            
            VStack(alignment: .center) {
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(Color.red)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .alignmentGuide(.crossAlignment, computeValue: {d in d[VerticalAlignment.center]})
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(Color.orange)
                    .frame(width: 100, height: 100)
            }
        }
    }
}

extension VerticalAlignment {
    private enum CrossAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.bottom]
        }
    }
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
}

struct StackView2_Previews: PreviewProvider {
    static var previews: some View {
        StackView2()
    }
}
