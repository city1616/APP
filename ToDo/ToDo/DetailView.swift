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
                    Text("\(selectedWork.date)")
                }
                // .padding()
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
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(selectedWork: taskData[0])
    }
}
