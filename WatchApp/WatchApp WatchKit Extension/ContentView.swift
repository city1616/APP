//
//  ContentView.swift
//  WatchApp WatchKit Extension
//
//  Created by SeungWoo Mun on 2020/08/02.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var ti = Date()
    var body: some View {
        ScrollView {
            VStack {
                Text("Hello, World!")
                Text("app")
                Text("hello")
                Text("Watch")
                Text("\(ti)")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
