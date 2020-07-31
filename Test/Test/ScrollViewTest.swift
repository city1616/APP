//
//  ScrollViewTest.swift
//  Test
//
//  Created by SeungWoo Mun on 2020/07/31.
//

import SwiftUI

struct ScrollViewTest: View {
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    GeometryReader { geometry in
                        HStack {
                            deadpool()
                            deadpool()
                            deadpool()
                        }
                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX) / -20),
                            axis: (x: 10.0, y: 10.0, z: 10.0))
                    }
                }
            
                
                // Spacer()
            }
            

        
    }
}

struct ScrollViewTest_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewTest()
    }
}

struct deadpool: View {
    var body: some View {
        Image("deadpool")
            .resizable()
            .frame(width: 300, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 4))
            .shadow(radius: 10)
            .padding()
    }
}
