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
            Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
                .edgesIgnoringSafeArea(.all)
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
                    todoList()
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
        ContentView()
            // .colorScheme(.dark)
    }
}
