//
//  Menu.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/20.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct Menu: View {
//    init() {  // navigationBar Color
//        let navBarApperance = UINavigationBar.appearance()
////        navBarApperance.largeTitleTextAttributes = [.foregroundColor: UIColor.purple]
////        navBarApperance.titleTextAttributes = [.foregroundColor: UIColor.purple]
//         navBarApperance.backgroundColor = UIColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
//        // UIView.appearance().backgroundColor = UIColor.red
//    }
    
    @State var showSideMenu = false
    @State var col = [#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)]
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showSideMenu = false
                    }
                }
            }
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
//                        Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
//                            .edgesIgnoringSafeArea(.all)
                    // MainView(showSideMenu: self.$showSideMenu)
                    MainView()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showSideMenu ? geometry.size.width / 2 : 0)
                        .disabled(self.showSideMenu ? true : false)
//                    Color.black
//                        .edgesIgnoringSafeArea(.all)
//                        List {
//                            ForEach(0 ..< 10) {
//                                Text("Row \($0)")
//                            }
//    //                        Text("1. ")
//    //                        Text("2. ")
//    //                        ListRow()
//                            .listRowBackground(Color.purple)
//                            ListRow()
//                        }
                    if self.showSideMenu {
                        SideMenu()
                            .frame(width: geometry.size.width / 2)
                            .transition(.move(edge: .leading))
                    }
                }
            .gesture(drag)
            }
            .navigationBarTitle("Home", displayMode: .automatic)
            .navigationBarItems(leading:
                HStack {
                    Button(action: {
                        withAnimation {
                            self.showSideMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            // .imageScale(.large)
                    }// .foregroundColor(.gray)
            }, trailing:
                HStack {
                    Button(action: {
                        // col = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
                    }) {
                        Image(systemName: "square.and.pencil")
                            .font(.title)
                    }// .foregroundColor(.gray)
            })
            // .navigationViewStyle(StackNavigationViewStyle())
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
