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
    
    var body: some View {
        NavigationView {
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
                        print("Perform as action here ")
                    }) {
                        Text("Reset All Settings")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
