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
    @State var searchbar: String
    @State var placeholder: String
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                        
                        if searchbar != "" {
                            Image(systemName: "magnifyingglass").foregroundColor(.secondary)
                        }
                        else {
                            Image(systemName: "book.fill").foregroundColor(.secondary)
                        }
                        
                        TextField(placeholder, text: $searchbar)
                            
                        if searchbar != "" {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.medium)
                                .foregroundColor(Color(.systemGray3))
                                // .padding(.leading, 320)
                                // .padding(.trailing, 30)
                                .padding(3)
                                .onTapGesture {
                                    withAnimation{
                                        self.searchbar = ""
                                    }
                                }
                        }
                        else {
                            Image(systemName: "magnifyingglass")
                                .imageScale(.medium)
                                .foregroundColor(Color(.systemGray3))
                                // .padding(.leading, 320 )
                                // .padding(.trailing, 30)
                                .padding(3)
                                .onTapGesture {
                                    withAnimation{
                                        self.searchbar = ""
                                    }
                                }
                        }
                    }
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(30) // 12
                    .padding(.vertical, 10)
                    
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
        MainView(searchbar: "", placeholder: "placeholder")
    }
}

