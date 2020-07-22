//
//  Menu.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/20.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct Menu: View {
//    init() {
//        UITableView.appearance().backgroundColor = UIColor(named: "backgroundLight")
//    }
    var body: some View {
            NavigationView {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    List {
                        ForEach(0 ..< 10) {
                            Text("Row \($0)")
                        }
//                        Text("1. ")
//                        Text("2. ")
//                        ListRow()
//                        ListRow()
                    }
                    .listRowBackground(Color.pink)
                    .navigationBarTitle("Menu")
                .navigationBarItems(leading:
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title)
                        }.foregroundColor(.gray)
                }, trailing:
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "square.and.pencil")
                                .font(.title)
                        }.foregroundColor(.gray)
                })
                }
            }
    }
}

struct ListRow: View {
    var body: some View {
        Text("Index")
            .listRowBackground(Color.pink)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
