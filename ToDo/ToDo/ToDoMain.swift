//
//  ToDoMain.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/27.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI
import CoreData

//struct ToDo: Identifiable {
//    var id = UUID()
//    // var date = String()
//    var work = String()
//    // var Done = String()
//}
//
//struct working: Codable, Identifiable {
//    let id = Int()
//    var work = String()
//    var date = Date()
//}

struct ToDoRow: View {
    
    var task: Task
    
    var body: some View {
        // Text("\(todo.id). \(todo.work)")
        NavigationLink(destination: DetailView(selectedWork: task)) {
            VStack(alignment: .leading) {
                Text("\(task.work)")
            }
        }
    }
}



struct ToDoMain: View {
    
    @ObservedObject var taskStore: TaskStore = TaskStore(tasks: [])
    
    @Environment(\.presentationMode) var present
    
    // @State var task : [working] = []
    // t.append(working(work: "end"))
    // @Binding var showSideMenu: Bool
    
    // var arr = ["a", "b", "c"]
    @State var selectDate = Date()
    // @State var listDoItem = [DoItem]()
    @State var addWork : String = ""
    @State var addDescription: String = ""
    @State var addItem = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("To do")) {
                    List {
                        // Text("")
                        ForEach(taskStore.tasks) { task in
                            ToDoRow(task: task)
                        }
                        .onDelete(perform: deleteItems)
                        .onMove(perform: moveItems)
                    }
                    // .listRowBackground(Color.red)
                // .listStyle(GroupedListStyle())
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
//            Section() {
//                Button(action: {}) {
//                    Text("abc:)")
//                }
//            }
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
                        // self.task.append(working(work: self.addWork))
                        self.saveTask() // core data
                        // self.AddTask()
                        self.addItem.toggle()

                        self.addWork = ""
                    }) {
                        Text("ADD")
                    }
                }
            }
        }
        
    }
    func saveTask() { // saving data in core data
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context)
        
        entity.setValue(self.addWork, forKey: "work")
        entity.setValue(self.selectDate, forKey: "date")
        
        do {
            try context.save()
            
            self.present.wrappedValue.dismiss()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    func getTasks() {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        do {
            let result = try context.fetch(req)
            
            self.taskStore.tasks.removeAll()
            
            for i in result as! [NSManagedObject] {
                let work = i.value(forKey: "work") as! String
                let date = i.value(forKey: "date") as! Date
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd-MM-YYYY"
                
                taskStore.tasks.append(Task(id: UUID().uuidString, work: work, date: date, description: ""))
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    func AddTask() {
        let newTask = Task(id: UUID().uuidString, work: addWork, date: selectDate, description: addDescription)
        taskStore.tasks.append(newTask)
        // self.task.append(working(work: "end"))
    }
    func deleteItems(at offets: IndexSet) {
        taskStore.tasks.remove(atOffsets: offets)
    }
    func moveItems(from source: IndexSet, to destination: Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    func doneTask(from source: IndexSet, to destination: Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
        let newTask = Task(id: UUID().uuidString, work: addWork, date: selectDate, description: addDescription)
        taskStore.tasks.append(newTask)
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
