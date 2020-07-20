//
//  ContentView.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/20.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Menu()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                    }
            Calendar()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
