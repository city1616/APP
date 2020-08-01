//
//  DetailView.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/22.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI
// import CoreData

struct DetailView: View {
    
    var selectedWork: Task
    
    
    var body: some View {
        Form {
            Section(header: Text("Work")) {
                HStack {
                    Text("할일")
                    Spacer()
                    Text("\(selectedWork.work)")
                }
            }
            Section(header: Text("DATE")) {
                HStack {
                    Text("Date")
                    Spacer()
                    Text("\(selectedWork.date, formatter: self.taskDateFormat())")
                }
                // .padding()
            }
            Section(header: Text("Description")) {
                HStack {
                    Text("상세 일정")
                    Spacer()
                    Text("\(selectedWork.description)")
                        .frame(height: 200)
                }
            }
            Section() {
                HStack(alignment: .center) {
                    Spacer()
                    Button(action: {}) {
                        Text("Done")
                    }
                    Spacer()
                }
            }
        // .navigationBarTitle(Text("Details"))
        // .navigationBarHidden(true)
        }
    }
//    func DeleteTask(task: Int) {
//        let app = UIApplication.shared.delegate as! AppDelegate
//        let context = app.persistentContainer.viewContext
//        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
//
//        do {
//            let result = try context.fetch(req)
//
//            for i in result as! [NSManagedObject] {
//                let currentTask = i.value(forKey: "task") as! String
//
//                if self.selectedWork.work == currentTask {
//                    context.delete(i)
//                    try context.save()
//
//                    self.selectedWork
//
//                    return
//                }
//            }
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//    }
    func taskDateFormat() -> DateFormatter {
        let formatter = DateFormatter()
        // formatter.dateFormat = "dd-MM-YYYY"
        formatter.dateStyle = .long
        return formatter
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(selectedWork: Task(id: UUID().uuidString, work: "", date: Date(), description: ""))
    }
}
