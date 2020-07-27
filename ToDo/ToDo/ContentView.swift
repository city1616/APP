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
    
    var body: some View {
        ZStack {
//            Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
//                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                    .frame(height: 1.0)
                TabView {
                    Menu()
                        .tabItem {
                            Image(systemName: "list.dash")
                            Text("Home")
                            }
                    // .edgesIgnoringSafeArea(.all)
                    ToDoMain()
                        .tabItem {
                            Image(systemName: "square.and.pencil")
                            Text("ToDo")
                    }
                    Calendar()
                        .tabItem {
                            Image(systemName: "calendar")
                            Text("Calendar")
                            }
                    Settings()
                        .tabItem {
                            Image(systemName: "hammer.fill")
                            Text("Settings")
                    }
                }
                // .background(/*@START_MENU_TOKEN@*/Color.green/*@END_MENU_TOKEN@*/)
                // .edgesIgnoringSafeArea(.top)
                .accentColor(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))) // Button color
                // #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            }
        }
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
