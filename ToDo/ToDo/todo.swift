//
//  todo.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/20.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct todo: View {
    @State private var name: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Username")
                .font(.callout)
                .bold()
            TextField("Enter your name", text: $name)
                // .background(Color.blue)
            // Color.blue
                .frame(width: 300.0)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.blue)
            Text("Hello, \(name)!!")
        }.padding()
    }
}

struct todo_Previews: PreviewProvider {
    static var previews: some View {
        todo()
    }
}
