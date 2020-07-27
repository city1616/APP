//
//  MainView.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/24.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

//var circleImage:  Type  {
//    Image("ㅇㅇㅇ")
//        .frame(width: 250, height: 250)
//        .clipShape(Circle())
//        .overlay(
//            Circle().stroke(Color.white, lineWidth: 4))
//        .shadow(radius: 10)
//}

struct MainView: View {
    // @Binding var showSideMenu: Bool
    var body: some View {
        ZStack {
            VStack {
                Image("ㅇㅇㅇ")
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding()
                
                Image("ㅇㅇㅇ")
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding()
//                Button(action: {
//                    // self.showSideMenu = true
//                    self.hello()
////                    print(self.buildMessageFor(name: "John", count: 100))
//                    print(self.buildMessageFor("John", 100))
//                }) {
//                    Text("Show Side Menu")
//                }
                
//                Button(action: {
//
//                }) {
//                    Text("Color")
//                }
                
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        // MainView(showSideMenu: false)
        MainView()
    }
}

