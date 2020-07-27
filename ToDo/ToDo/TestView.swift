//
//  TestView.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/27.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct TestView: View {
    
    @State private var wifiEnabled = true
    @State private var userName = ""
    
    var body: some View {
        
//        VStack {
//            Toggle(isOn: $wifiEnabled) {
//                Text("Enable Wi-fi")
//                // .padding()
//            }
//            .padding()
//            TextField("Enter user name", text: $userName)
//            Text(userName)
//            Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
//        }
        itemadd()
    // .padding()
    }
}

struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(Color.white)
            .border(Color.gray, width: 0.2)
            .shadow(color: Color.black, radius: 5, x: 0, y: 0)
    }
}

struct stackView: View {
    let carStack = HStack {
        Text("Car Image")
        Image(systemName: "car.fill")
    }
    var body: some View {
        VStack {
            Text("Main Title")
                .font(.headline)
                .foregroundColor(.red)
            HStack {
                Text("Car Image")
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            carStack
                .font(.largeTitle)
            Text("Sample Text")
                .font(.custom("Copperplate", size: 70))
                .padding()
                .border(Color.black)
                .padding()
            Text("title")
                .modifier(StandardTitle())
        }
    }
}

struct Item: Hashable {
    let name: String
    let color: UIColor
}

struct itemadd: View {
    @State var listItems = [Item]()
    @State var addItemName : String = ""
    @State var colorSelection: UIColor = UIColor.systemRed
    @State var addItem = false
    var body: some View {
        ZStack {
            VStack {
                NavigationView {
                    List {
                        ForEach(listItems, id: \.self) { item in
                            Text(item.name).listRowBackground(Color(item.color))
                        }
                    }
                        .navigationBarTitle(Text("List Items"))
                        // Adds the plus button to our navbar
                        .navigationBarItems(trailing:
                            Button(action: {
                                // toggles the value of our bool from false to true,
                                // which will present our sheet.
                                self.addItem.toggle()
                            }, label: {
                                Image(systemName: "plus")
                            })
                                
                    )
                // This is our secondary view that'll take in our user's input.
                // Is presented when addItem is set to true.
                }.sheet(isPresented: $addItem) {
                    VStack {
                        HStack {
                            Text("Item Name: ")
                            TextField("Add an Item", text: self.$addItemName)
                        }
                        // A simple picker that gives our user some different selections of color.
                        Picker(selection: self.$colorSelection, label: Text("Select a Color")) {
                            Text("Red").tag(UIColor.systemRed)
                            Text("Blue").tag(UIColor.systemBlue)
                            Text("Green").tag(UIColor.systemGreen)
                            Text("Yellow").tag(UIColor.systemYellow)
                        }
                        // Button that will submit our data to the list and reset our user selected
                        // variables for when then add another item.
                        Button(action: {
                            self.listItems.append(Item(name: self.addItemName, color: self.colorSelection))
                            
                            // This will close our sheet view when the user click our Add button.
                            self.addItem.toggle()
                            
                            // Reset Values
                            self.addItemName = ""
                            self.colorSelection = UIColor.systemRed
                        }, label: {
                            Text("Add")
                        })
                    }.padding(100)
                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
