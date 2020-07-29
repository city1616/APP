//
//  MainView.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/24.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct circleImage: View {
    var body: some View {
        Image("ㅇㅇㅇ")
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct MainView: View {
    // @Binding var showSideMenu: Bool
    @State var searchbar: String
    @State var placeholder: String
    
    var body: some View {
        ZStack {
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
                    .padding(.all, 10)
                
                ScrollView {
                    VStack {
                        circleImage()
                            .padding()
                        circleImage()
                            .padding()
                        circleImage()
                            .padding()
                    }
                    .frame(width: 375)
                }
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
        MainView(searchbar: "", placeholder: "placeholder")
    }
}

struct Home: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                // now going to do strechy header
                
                Image("ㅇㅇㅇ")
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                
                VStack {
                    HStack {
                        Text("New Home")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("See All")
                                .fontWeight(.bold)
                        }
                    }
    //                // testing data..
    //                CardView(data: data[0])
                    VStack(spacing: 20) {
                        ForEach(data) { i in
                            CardView(data: i)
                        }
                    }
                    .padding(.top)
                }
                .padding()
                
                Spacer()
            }
        })
            
        .edgesIgnoringSafeArea(.top)
    }
}

// CardView...
struct CardView: View {
    
    var data: Card
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(self.data.image)
                .resizable()
                .frame(width: 80, height: 80)
            VStack(alignment: .leading, spacing: 6) {
                Text(self.data.title)
                    .fontWeight(.bold)
                Text(self.data.subTitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                HStack(spacing: 12) {
                    Button(action: {}) {
                        Text("Get")
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            // for adapting to dark mode ...
                            .background(Color.primary.opacity(0.06))
                            .clipShape(Capsule())
                    }
                    Text("In-App\n Purchases")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            Spacer(minLength: 0)
        }
    }
}


// sample data for cards...
struct Card: Identifiable {
    var id: Int
    var image: String
    var title: String
    var subTitle: String
}
var data = [
    Card(id: 0, image: "ㅇㅇㅇ", title: "Zombie Gunship Survival", subTitle: "Tour the apocalypse"),
    Card(id: 1, image: "ㅇㅇㅇ", title: "Portal", subTitle: "Travel through dimensions"),
    Card(id: 2, image: "ㅇㅇㅇ", title: "Wave Form", subTitle: "Fun enagaging wave game"),
    Card(id: 3, image: "ㅇㅇㅇ", title: "Temple Run", subTitle: "Run for your life"),
    Card(id: 4, image: "ㅇㅇㅇ", title: "World of Warcraft", subTitle: "Be whoever you want"),
    Card(id: 5, image: "ㅇㅇㅇ", title: "Alto's Adventure", subTitle: "A snowboarding odyssey"),
    Card(id: 6, image: "ㅇㅇㅇ", title: "Space Frog", subTitle: "Jump and have fun"),
    Card(id: 7, image: "ㅇㅇㅇ", title: "Dinosaur Mario", subTitle: "Keep running")
    
]
