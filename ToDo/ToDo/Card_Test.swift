//
//  Card_Test.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/22.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct Card_Test: View {
    @State var showMenu = false
    
    var body: some View {
//        MainView()
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                         .offset(x: self.showMenu ? geometry.size.width / 2 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width / 2)
                            .transition(.move(edge: .leading))
                    }
                }
             .gesture(drag)
            }
            .navigationBarTitle(Text("Hello"), displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                })
        }
    }
}

struct MainView: View {
    @Binding var showMenu: Bool
    var body: some View {
        Button(action: {
//            print("Open the side menu")
            withAnimation {
                self.showMenu = true
            }
        }) {
            Text("Show menu")
        }
    }
}

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(.gray)
                    .font(.headline)
            }.padding(.top, 100)
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Message")
                    .foregroundColor(.gray)
                    .font(.headline)
            }.padding(.top, 30)
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
            }.padding(.top, 30)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Card_Test_Previews: PreviewProvider {
    static var previews: some View {
        Card_Test()
    }
}
