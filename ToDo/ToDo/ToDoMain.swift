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

struct working: Identifiable {
    let id = UUID()
    var work = String()
}

struct DoItem: Hashable {
    let work: String
}

struct ToDoRow: View {
    var todo: working
    var body: some View {
        // Text("\(todo.id). \(todo.work)")
        Text("\(todo.work)")
    }
}

struct ToDoMain: View {
    
    @State var task = [working]()
    // t.append(working(work: "end"))
    // @Binding var showSideMenu: Bool
    
    // var arr = ["a", "b", "c"]
    
    @State var listDoItem = [DoItem]()
    @State var addWork : String = ""
    @State var addItem = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("To do")) {
                    List(task) { taskList in
                        NavigationLink(destination: DetailView(work: taskList.work)) {
                            VStack(alignment: .leading) {
                                // Text(todolist_t.work)
                                ToDoRow(todo: taskList)
                            }
                        }
                    }
                }
                
                Section(header: Text("Doing")) {
                    Text("")
                    Button(action: AddTask
                        // self.task.append(working(work: "end"))
                        // print(self.t)
                        // add()
                        // self.t += [working(work: "end")]
                    ) {
                        Text("add")
                    }
                }
                
                Section(header: Text("Done")) {
                    List {
                        ForEach(listDoItem, id: \.self) { item in
                            Text(item.work)
                        }
                    }
                }
                    
                Section(header: Text("Don't")) {
                    Text("")
                }
            }
            .navigationBarTitle(Text("ToDo"))
                .navigationBarItems(leading:
                    HStack {
                        Button(action: {
    //                            withAnimation {
    //                                self.showSideMenu.toggle()
    //                            }
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title)
                        }
                }, trailing:
                    Button(action: {
                        self.addItem.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                })
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
