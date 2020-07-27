//
//  TestView.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/27.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct TestView: View {
    let carStack = HStack {
        Text("Car Image")
        Image(systemName: "car.fill")
    }
    var body: some View {
        
        VStack {
            Text("Main Title")
                .font(.headline)
                .foregroundColor(.red)
            HStack {
                Text("Car Image")
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            carStack
                .font(.largeTitle)
            Text("Sample Text")
                .font(.custom("Copperplate", size: 70))
                .padding()
                .border(Color.black)
                .padding()
            Text("title")
                .modifier(StandardTitle())
        }
    }
}

struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(Color.white)
            .border(Color.gray, width: 0.2)
            .shadow(color: Color.black, radius: 5, x: 0, y: 0)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
