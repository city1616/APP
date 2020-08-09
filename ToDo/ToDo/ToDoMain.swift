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

    @State var selectDate = Date()
    @State var addWork : String = ""
    @State var addDescription: String = ""
    @State var addItem = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("To do")) {
                    List {
//                        Text("")
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
//                    List {
//                        ForEach(0 ..< self.taskStore.tasks.count, id: \.self) { i in
//                            HStack {
//                                Button(action: {
//                                    self.DeleteTask(task: i)
//                                }) {
//                                    Image(systemName: "checkmark.circle")
//                                        .resizable()
//                                        .frame(width: 22, height: 22)
//                                        .foregroundColor(.purple)
//                                        .padding(.trailing, 10)
//                                }
//                                Text(self.taskStore.tasks[i].work)
//                            }
//                        }
//                    }
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
                    .sheet(isPresented: $addItem) {
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
                            Section(header: Text("Description")) {
                                HStack {
                                    Text("상세 일정")
                                    Spacer()
                                    TextField("Description", text: self.$addDescription)
                                        .frame(width: 250)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                }
                            }
                            Section() {
                                Button(action: {
                                    self.saveTasks() // core data
                                    self.getTasks() // read core data
                                    // self.AddTask()
                                    self.addItem.toggle()

                                    
                                    // Reset
                                    self.addWork = ""
                                    self.selectDate = Date()
                                    self.addDescription = ""
                                    
                                }) {
                                    Text("ADD")
                                }
                            }
                        }
                    }
                }, trailing: EditButton())
            .onAppear {
                self.getTasks()
            }
        }
        
    }
    
    func saveTasks() { // saving data in core data
        let app = UIApplication.shared.delegate as! AppDelegate

        let context = app.persistentContainer.viewContext

        let entity = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context)

        entity.setValue(self.addWork, forKey: "work")
        entity.setValue(self.selectDate, forKey: "date")
        entity.setValue(self.addDescription, forKey: "descript")

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
                let descript = i.value(forKey: "descript") as! String
//
//                let formatter = DateFormatter()
//                formatter.dateFormat = "dd-MM-YYYY"

                taskStore.tasks.append(Task(id: UUID().uuidString, work: work, date: date, description: descript))
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func DeleteTask(task: Int) {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")

        do {
            let result = try context.fetch(req)

            for i in result as! [NSManagedObject] {
                let currentTask = i.value(forKey: "task") as! String

                if self.taskStore.tasks[task].work == currentTask {
                    context.delete(i)
                    try context.save()

                    self.taskStore.tasks.remove(at: task)

                    return
                }
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func AddTask() {
        let newTask = Task(id: UUID().uuidString, work: addWork, date: selectDate, description: addDescription)
        taskStore.tasks.append(newTask)
    }
    
    func deleteItems(at offets: IndexSet) {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
//        for index in offets {
//            do {
//                let obj = taskStore.tasks[index]
//
//                // context.delete(obj)
//
//                try context.save()
//
//                // let index = taskStore.tasks.firstIndex(of: obj)
//
//                taskStore.tasks.remove(at: index)
//            }
//            catch {
//                print(error.localizedDescription)
//            }
//        }
        do {
            let result = try context.fetch(req)

            for i in result as! [NSManagedObject] {

                context.delete(i)

                try context.save()
                // self.taskStore.tasks.remove(at: task)
                self.taskStore.tasks.remove(atOffsets: offets)

                return
            }
        }
        catch {
            print(error.localizedDescription)
        }
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



struct ToDoMain_Previews: PreviewProvider {
    static var previews: some View {
        ToDoMain()
    }
}
