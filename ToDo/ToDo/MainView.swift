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
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(showSideMenu: false)
//    }
//}
