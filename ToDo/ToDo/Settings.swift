//
//  Settings.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/21.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI
import CoreData


struct Settings: View {
    
//    @Environment(\.presentationMode) var present
    
    @State var userName: String = ""
    @State var isPrivate: Bool = true
    @State var notificationsEnabled: Bool = false
    @State private var previewIndex = 0
    var previewOptions = ["Always", "When Unlocked", "Never"]
    
    @Binding var BtnColor: Color
    // @Binding var colorIndex: Int
    // var colors: [Color] = [Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1)), Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]  // [.purple, .black, .red, .green, .blue]
    // var colorOption = ["Green", "Purple", "Black", "Pink", "Blue"]
    
    @State private var colIndex = 0
    var colOption = ["Purple", "Black", "Pink", "Blue", "Green"]
    @State var cols: [UIColor] = [#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)]
    
    @State private var showAlert = false
    
    @State var navBarApperance = UINavigationBar.appearance()
    
    fileprivate func NaviColorChange() {
        //                            self.navBarApperance.backgroundColor = UIColor(Color(self.cols[self.colIndex]))
        // self.navBarApperance.backgroundColor = UIColor(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        // print(self.colorIndex)
        switch self.colIndex {
        case 0:
            self.navBarApperance.backgroundColor = UIColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        case 1:
            self.navBarApperance.backgroundColor = UIColor(#colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1))
        case 2:
            self.navBarApperance.backgroundColor = UIColor(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        case 3:
            self.navBarApperance.backgroundColor = UIColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        case 4:
            self.navBarApperance.backgroundColor = UIColor(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        default:
            self.navBarApperance.backgroundColor = UIColor(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
    
    var body: some View {
        
        return NavigationView {
            ZStack {
//                Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
//                    .edgesIgnoringSafeArea(.all)
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
                        
                        ColorPicker("Button Color", selection: $BtnColor)
                            .foregroundColor(BtnColor)
                        
//                        Picker(selection: $colorIndex, label: Text("Button Color").foregroundColor(self.colors[self.colorIndex])) {
//                            ForEach(0 ..< colorOption.count) {
//                                Text(self.colorOption[$0])
//                                    .foregroundColor(self.colors[$0])
//                            }
//                        }
                        Picker(selection: $colIndex, label: Text("Background Color").foregroundColor(Color(self.cols[self.colIndex]))) {
                            ForEach(0 ..< colOption.count) {
                                Text(self.colOption[$0])
                                    // .fontWeight(.bold)
                                    .foregroundColor(Color(self.cols[$0]))
//                                    .onTapGesture {
//                                        self.NaviColorChange()
//                                    }
                            }
                        }
                        // .pickerStyle(WheelPickerStyle())
                        
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
                        HStack {
                            Spacer()
                            Button(action: {
                                self.showAlert = true
                            }) {
                                Text("Reset All Settings")
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(title: Text("Reset"), message: Text("reset????????"), primaryButton: .destructive(Text("OK"), action: reset), secondaryButton: .cancel())
                            }
                            Spacer()
                        }
                        
                        HStack(alignment: .center) {
                            Spacer()
                            Button(action: {
                                self.NaviColorChange()
                            }) {
                                Text("적용")
                            }
                            Spacer()
                        }
                    }
                }
                // .accentColor(Color(self.colors[self.colerIndex]))
                .navigationBarTitle("Settings")
                // .navigationBarTitleDisplayMode(.automatic)
            }
        }
        // .accentColor(UIColor(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))))
            // .accentColor(UIColor(Color(self.colors[self.colorIndex]))) // Button color
    }
    func reset() {
        self.isPrivate = true
        self.notificationsEnabled = false
        self.previewIndex = 0
        // self.colorIndex = 0
        self.colIndex = 0
    }
    
//    func saveSettings() { // saving data in core data
//        let app = UIApplication.shared.delegate as! AppDelegate
//
//        let context = app.persistentContainer.viewContext
//
//        let entity = NSEntityDescription.insertNewObject(forEntityName: "Setting", into: context)
//
//        entity.setValue(BtnColor, forKey: "color")
////        entity.setValue(self.selectDate, forKey: "date")
////        entity.setValue(self.addDescription, forKey: "descript")
//
//        do {
//            try context.save()
//
//            self.present.wrappedValue.dismiss()
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//    }
    
//    func getSettings() {
//        let app = UIApplication.shared.delegate as! AppDelegate
//        let context = app.persistentContainer.viewContext
//
//        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Setting")
//        do {
//            let result = try context.fetch(req)
//
//            for i in result as! [NSManagedObject] {
//                let color = i.value(forKey: "color") as! String
////                let date = i.value(forKey: "date") as! Date
////                let descript = i.value(forKey: "descript") as! String
////
////                let formatter = DateFormatter()
////                formatter.dateFormat = "dd-MM-YYYY"
////
////                taskStore.tasks.append(Task(id: UUID().uuidString, work: work, date: date, description: descript))
//            }
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//    }
}

struct Settings_Previews: PreviewProvider {
    @Binding var a: Int
    static var previews: some View {
        Settings(BtnColor: .constant(Color.black))
    }
}
