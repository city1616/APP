//
//  MainView.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/24.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @Binding var showSideMenu: Bool
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    self.showSideMenu = true
                    self.hello()
//                    print(self.buildMessageFor(name: "John", count: 100))
                    print(self.buildMessageFor("John", 100))
                }) {
                    Text("Show Side Menu")
                }
                
//                Button(action: {
//
//                }) {
//                    Text("Color")
//                }
                List() {
                    Text("a")
                    Text("b")
                }
            }
        }
    }
    
    func hello() {
        print("Hello")
    }
    func buildMessageFor(_ name: String, _ count: Int) -> String {
        return "\(name), you are a customer number \(count)"
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(showSideMenu: false)
//    }
//}
