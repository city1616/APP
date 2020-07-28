//
//  ToDoMain.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/27.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

//struct ToDo: Identifiable {
//    var id = UUID()
//    // var date = String()
//    var work = String()
//    // var Done = String()
//}

struct working: Codable, Identifiable {
    let id = Int()
    var work = String()
    var date = Date()
}

//struct DoItem: Hashable {
//    let work: String
//}

struct ToDoRow: View {
    
    var todo: working
    
    var body: some View {
        // Text("\(todo.id). \(todo.work)")
        NavigationLink(destination: DetailView(work: todo)) {
            VStack(alignment: .leading) {
                Text("\(todo.work)")
            }
        }
    }
}

struct ToDoMain: View {
    
    @State var task : [working] = []
    // t.append(working(work: "end"))
    // @Binding var showSideMenu: Bool
    
    // var arr = ["a", "b", "c"]
    @State var selectDate = Date()
    // @State var listDoItem = [DoItem]()
    @State var addWork : String = ""
    @State var addItem = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("To do")) {
                    List {
                        // Text("")
                        ForEach(task) { taskList in
                            ToDoRow(todo: taskList)
                        }
                        .onDelete(perform: deleteItems)
                        .onMove(perform: moveItems)
                    }
                }
                
                Section(header: Text("Doing")) {
                    Text("")
                }
                
                Section(header: Text("Done")) {
                    List {
                        Text("")
//                        ForEach(listDoItem, id: \.self) { item in
//                            Text(item.work)
//                        .onDelete(perform: deleteItems)
//                        .onMove(perform: moveItems)
                    }
                }
                
                Section(header: Text("Don't")) {
                    Text("")
                }
                Section() {
                    Button(action: AddTask) {
                        Text("add")
                    }
                }
            }
            .navigationBarTitle(Text("ToDo"))
            .navigationBarItems(leading:
                HStack {
                    Button(action: {
                        self.addItem.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                }, trailing: EditButton())
        }.sheet(isPresented: $addItem) {
//            todo()
            Form {
                Section(header: Text("task")) {
                    HStack {
                        Text("할일")
                        Spacer()
                        TextField("Add Task", text: self.$addWork)
                            .frame(width: 250)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    DatePicker("Date", selection: self.$selectDate, displayedComponents: .date)
                }
                Section() {
                    Button(action: {
                        self.task.append(working(work: self.addWork))

                        self.addItem.toggle()

                        self.addWork = ""
                    }) {
                        Text("ADD")
                    }
                }
            }
        }
        
    }
    func AddTask() {
        self.task.append(working(work: "end"))
    }
    func deleteItems(at offets: IndexSet) {
        task.remove(atOffsets: offets)
    }
    func moveItems(from source: IndexSet, to destination: Int) {
        task.move(fromOffsets: source, toOffset: destination)
    }
}

//struct ToDoMain_Previews: PreviewProvider {
//    // @Binding var showSideMenu: Bool
//    static var previews: some View {
//        ToDoMain()
//        // self.showSideMenu = false
//        // ToDoMain(showSideMenu: self.$showSideMenu)
////            .colorScheme(.dark)
//    }
//}

struct ToDoMain_Previews: PreviewProvider {
    static var previews: some View {
        ToDoMain()
    }
}
