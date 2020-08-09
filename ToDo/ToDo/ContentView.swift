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
        MainTabView()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                .previewDisplayName("iPhone 11 pro")
                .colorScheme(.dark)
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone X"))
                .previewDisplayName("iPhone X")
                // .environment(\.colorScheme, .dark)
        }
            // .colorScheme(.dark) == .environment(\.colorScheme, .dark) Dark Mode
    }
}
