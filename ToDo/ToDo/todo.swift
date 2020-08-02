//
//  todo.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/20.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct todo: View {
    @State private var doing: String = ""
    @State var selectedTag: String?
    
    var body: some View {
        
        
        ZStack {
            Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName : "pencil")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                Form {
                    Section(header: Text("work")) {
                        HStack {
                            Text("할일")
                            Spacer()
                            TextField("", text: $doing)
                                .frame(width: 250)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                    Section() {
                        Button(action: {}) {
                            Text("Submit")
                        }
                    }
                    Section() {
                        NavigationLink(destination: EmptyView()) {
                            Text("a")
                        }
                    }
                    Section() {
                        Button(action: {
                            self.selectedTag = "xx"
                        }, label: {
                            Image(systemName: "plus")
                        })
                            .background(NavigationLink(destination: Text("XX"), tag: "xx", selection: $selectedTag, label: {EmptyView()}))
                    }
                    VStack(alignment: .leading) {
                        Text("ADD")
                            .font(.title)
                            .bold()
                        HStack {
                            Spacer()
                            Text("할일")
                            Spacer()
                            TextField("", text: $doing)
                                .frame(width: 250)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        // TextField("", text: $name)
                            // .background(Color.blue)
                        // Color.blue
                        // .foregroundColor(Color.blue)
                            
                            
                        Text("Hello, \(doing)!!")
                        Spacer()
                    }
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                }
            }
            // .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
        }
//            .navigationBarTitle("ADD")
//            .navigationBarItems(leading: Button(action: {}) {
//                Image(systemName: "line.horizontal.3")
//                    .font(.title)
//                }, trailing: Button(action: {}) {
//                    Image(systemName: "square.and.pencil")
//                        .font(.title)
//            })

    }
}

struct todo_Previews: PreviewProvider {
    static var previews: some View {
        todo()
    }
}
