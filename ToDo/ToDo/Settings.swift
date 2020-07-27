//
//  Settings.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/21.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var userName: String = ""
    @State var isPrivate: Bool = true
    @State var notificationsEnabled: Bool = false
    @State private var previewIndex = 0
    var previewOptions = ["Always", "When Unlocked", "Never"]
    @State private var colorIndex = 0
    var colorOption = ["red", "blue", "green"]
    @State private var showAlert = false
    
    @State var navBarApperance = UINavigationBar.appearance()
    
    var body: some View {
        
        
//        navBarApperance.backgroundColor = UIColor(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        
        
//        switch colorOption {
//        case ["red"]:
//            navBarApperance.backgroundColor = UIColor.red
//        case ["blue"]:
//            navBarApperance.backgroundColor = UIColor.blue
//        case ["green"]:
//            navBarApperance.backgroundColor = UIColor.green
//        default:
//            navBarApperance.backgroundColor = UIColor(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
//        }
        
//        switch self.colorIndex {
//        case 0:
//            navBarApperance.backgroundColor = UIColor.red
//        case 1:
//            navBarApperance.backgroundColor = UIColor.blue
//        case 2:
//            navBarApperance.backgroundColor = UIColor.green
//        default:
//            navBarApperance.backgroundColor = UIColor(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
//        }
        
        return NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                Form {
                    Section(header: Text("PROFILE")) {
                       TextField("Username", text: $userName)
                       Toggle(isOn: $isPrivate) {
                           Text("Private Account")
                       }
                    }
                    Section(header: Text("NOTIFICATIONS")) {
                        Toggle(isOn: $notificationsEnabled) {
                            Text("Enabled")
                        }
                        Picker(selection: $previewIndex, label: Text("Show Previews")) {
                            ForEach(0 ..< previewOptions.count) {
                                Text(self.previewOptions[$0])
                            }
                        }
                    }
                    Section(header: Text("THEME")) {
                        Picker(selection: $colorIndex, label: Text("Color")) {
                            ForEach(0 ..< colorOption.count) {
                                Text(self.colorOption[$0])
                            }
                        }
                        Button(action: {
                             self.navBarApperance.backgroundColor = UIColor(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
                            // print(self.colorIndex)
                        }) {
                            Text("적용")
                        }
                    }
                    Section(header: Text("ABOUT")) {
                        VStack {
                            HStack {
                                Text("Version")
                                Spacer()
                                Text("1.0")
                            }
                            HStack {
                                Text("Made by city1616")
                            }
                        }
                    }
                    Section() {
                        Button(action: {
                            self.showAlert = true
                        }) {
                            Text("Reset All Settings")
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Reset"), message: Text("reset????????"), primaryButton: .destructive(Text("OK"), action: reset), secondaryButton: .cancel())
                        }
                    }
                }
                .navigationBarTitle("Settings")
            }
        }
    }
    func reset() {
        self.isPrivate = true
        self.notificationsEnabled = false
        self.previewIndex = 0
        self.colorIndex = 0
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
