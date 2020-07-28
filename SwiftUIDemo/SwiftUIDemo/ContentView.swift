//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by SeungWoo Mun on 2020/07/28.
//

import SwiftUI

struct ContentView: View {
    
    var colors: [Color] = [.purple, .black, .red, .green, .blue]
    var colornames = ["Purple", "Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to SwiftUI"
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Spacer()
                    Text("!LOLOLOLOLOLOLOL!")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .rotationEffect(.degrees(self.rotation))
                        .animation(.easeInOut(duration: 2))
                        .foregroundColor(self.colors[self.colorIndex])
                    Spacer()
                    Divider()
                    Slider(value: $rotation, in: 0 ... 360, step: 0.1)
                        .padding()
                    
                    TextField("Enter text here", text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Picker(selection: $colorIndex, label: Text("Color")) {
                        ForEach(0 ..< colornames.count) {
                            Text(self.colornames[$0])
                                .foregroundColor(self.colors[$0])
                        }
                    }
                    .padding()
                }
            }
            .navigationBarItems(leading: Button(action: {}) {
                Text("add")
            }, trailing: NavigationLink(destination: CarView()) {
                Text("Next Page")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
