//
//  ContentView.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/20.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
        // UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(named: "Secondary")
    }
    
//    @Binding var showSideMenu: Bool
    @State var selectedView = 0
    // var col = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
     // @Binding var colorIndex: Int
    @State var col = [#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]
    @State var colIndex = 0
    
    var body: some View {
        ZStack {
//            Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
//                .edgesIgnoringSafeArea(.all)
            VStack {
//                Spacer()
//                    .frame(height: 1.0)
                TabView(selection: $selectedView) {
                    Menu()
                        .tabItem {
                            Image(systemName: "list.dash")
                            Text("Home")
                    }.tag(0)
                    // .edgesIgnoringSafeArea(.all)
                    ToDoMain()
                        .tabItem {
                            Image(systemName: "square.and.pencil")
                            Text("ToDo")
                    }.tag(1)
                    Calendar()
                        .tabItem {
                            Image(systemName: "calendar")
                            Text("Calendar")
                    }.tag(2)
                    Settings(colorIndex: $colIndex)
                        .tabItem {
                            Image(systemName: "hammer.fill")
                            Text("Settings")
                    }.tag(3)
//                    Home()
//                        .tabItem {
//                            Image(systemName: "person")
//                            Text("Home")
//                    }.tag(4)
                }
                .padding(.top, 45)
                .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                .edgesIgnoringSafeArea(.top)
                .accentColor(Color(col[colIndex])) // Button color
                // #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    var c = 0
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
