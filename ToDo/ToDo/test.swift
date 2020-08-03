//
//  test.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/08/03.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct test: View {
    
    @State var showto = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        self.showto.toggle()
                    }) {
                        Text("test")
                    }
                    Spacer()
                    Text("test")
                    Spacer()
                }
            .padding()
            }
            
            if self.showto {
                ttView()
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}

struct ttView: View {
    var body: some View {
        Text("a")
            .background(Color.red)
    }
}
