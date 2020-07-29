//
//  ContentView.swift
//  MinimalToDo
//
//  Created by SeungWoo Mun on 2020/07/29.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var todayTasks: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                HomeCalendarView()
                    .padding(.vertical, 25)
                
                VStack {
                    HStack {
                        Text("TASKS")
                            .fontWeight(.bold)
                        
                        Spacer()
                        
//                        Button(action: {
//
//                        }) {
//                            Image(systemName: "plus")
//                                .resizable()
//                                .frame(width: 22, height: 22)
//                                .padding(.horizontal)
//
//                        }
                        // Use NavigationLink
                        NavigationLink(destination: AddPage()) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.leading)
                    
                    Divider()
                        .background(Color.black.opacity(0.8))
                }
                
                GeometryReader { _ in
                    if !self.todayTasks.isEmpty {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                ForEach(0 ..< self.todayTasks.count, id: \.self) { i in
                                    HStack {
                                        Button(action: {
                                            self.DeleteTask(task: i)
                                        }) {
                                            Image(systemName: "checkmark.circle")
                                                .resizable()
                                                .frame(width: 22, height: 22)
                                                .foregroundColor(.green)
                                                .padding(.trailing, 10)
                                        }
                                        Text(self.todayTasks[i])
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                    .padding(.top, 20)
                                }
                            }
                        }
                    }
                }
                
            }
            .navigationBarTitle("ToDo", displayMode: .large)
            .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.bottom))
            .onAppear {
                self.getTasks()
                self.DeleteOldTasks()
            }
        }
    }
    // reading data
    
    func getTasks() {
        let app = UIApplication.shared.delegate as! AppDelegate
        
        // creating context from app delegate
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
        do {
            // going to fetch all data
            let result = try context.fetch(req)
            
            self.todayTasks.removeAll()
            
            for i in result as! [NSManagedObject] {
                let task = i.value(forKey: "task") as! String
                let date = i.value(forKey: "date") as! Date
                
                // comparing data and displaying only today tasks
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd-MM-YYYY"
                
                if formatter.string(from: date) == formatter.string(from: Date()) {
                    // append to array
                    self.todayTasks.append(task)
                }
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func DeleteOldTasks() {
        
        // deleting all old data
        
        let app = UIApplication.shared.delegate as! AppDelegate
        
        // creating context from app delegate
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        
        do {
            // going to fetch all data
            let result = try context.fetch(req)
            
//            self.todayTasks.removeAll()
            
            for i in result as! [NSManagedObject] {
                let date = i.value(forKey: "date") as! Date
                
                // comparing data and displaying only today tasks
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd-MM-YYYY"
                
                // quering old data
                if formatter.string(from: date) < formatter.string(from: Date()) {
                    context.delete(i)
                    try context.save()
                }
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    // separate deletion
    func DeleteTask(task: Int) {
            
            // deleting all old data
            
            let app = UIApplication.shared.delegate as! AppDelegate
            
            // creating context from app delegate
            let context = app.persistentContainer.viewContext
            
            let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
            
            do {
                // going to fetch all data
                let result = try context.fetch(req)
                
    //            self.todayTasks.removeAll()
                
                for i in result as! [NSManagedObject] {
                    let currentTask = i.value(forKey: "task") as! String
                    
                    if self.todayTasks[task] == currentTask {
                        context.delete(i)
                        try context.save()
                        
                        self.todayTasks.remove(at: task)
                        
                        return
                    }
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
}

// Add Page
struct AddPage: View {
    
    @State var date = Date()
    @State var task = ""
    @Environment(\.presentationMode) var present
    
    var body: some View {
        VStack {
            Spacer(minLength: 0)

            CalendarView(date: self.$date)
                .padding(.vertical, 20)
            
            Spacer(minLength: 0)
            
            Divider()
                .background(Color.black.opacity(0.8))
            
            TextField("Type Here", text: self.$task)
                .padding(.horizontal)
                .padding(.vertical)
        }
        .navigationBarTitle("Add New Task", displayMode: .large)
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.bottom))
        .navigationBarItems(trailing:
            Button(action: {
                self.saveTask()
            }, label: {
                Text("Done")
                    .fontWeight(.bold)
            })
                .disabled(self.task == "" ? true : false)
        )
    }
    
    // saving data in Core Data
    func saveTask() {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        
        // creating context from app delegate
        let context = app.persistentContainer.viewContext
        // going to insert new object into entity Todo
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context)
        // key specified in core data
        entity.setValue(self.task, forKey: "task")
        entity.setValue(self.date, forKey: "date")
        
        do {
            // saving data
            
            try context.save()
            
            // if succeeds
            // pop the view
            
            // it will dismiss top view on stack
            self.present.wrappedValue.dismiss()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

// We already a made a video on Custom Calendar
// Link is in the description
// check it out
// were going to use it now

struct HomeCalendarView: View {
    
    @State var date = Date()
    @State var data: DateType!
    
    var body: some View{
        VStack {
            if self.data != nil {
                ZStack {
                    VStack(spacing: 15) {
                        ZStack {
                            HStack {
                                Spacer()
                                Text(self.data.Month)
                                    .font(.title)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding(.vertical)
                            
                        }
                        .background(Color.red)
                        
                        Text(self.data.Date)
                            .font(.system(size: 65))
                            .fontWeight(.bold)
                        
                        Text(self.data.Day)
                            .font(.title)
                        
                        Divider()
                        
                        ZStack {
                            Text(self.data.Year)
                                .font(.title)
                        }
                       
                    }
                    .padding(.bottom, 12)
    
                }
                .frame(width: UIScreen.main.bounds.width / 1.5)
                .background(Color.white)
                .cornerRadius(15)
            }
        }
        .onAppear {
            // updating date when ever it appears
            self.date = Date()
            self.UpdateDate()
        }
    }
    func UpdateDate() {
        let current = Calendar.current
        
        let date = current.component(.day, from: self.date)
        let monthNO = current.component(.month, from: self.date)
        let month = current.monthSymbols[monthNO - 1]
        let year = current.component(.year, from: self.date)
        let weekno = current.component(.weekday, from: self.date)
        let day = current.weekdaySymbols[weekno - 1]
        
        self.data = DateType(Day: day, Date: "\(date)", Year: "\(year)", Month: month)
    }
}

struct CalendarView: View {
    
    @Binding var date: Date
    @State var data: DateType!
    @State var expand = false
    @State var year = false
    
    var body: some View{
        VStack {
            if self.data != nil {
                ZStack {
                    VStack(spacing: 15) {
                        ZStack {
                            HStack {
                                Spacer()
                                Text(self.data.Month)
                                    .font(.title)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding(.vertical)
                            
                            HStack {
                                Button(action: {
                                    self.date = Calendar.current.date(byAdding: .month, value: -1, to: self.date)!
                                    self.UpdateDate()
                                }) {
                                    Image(systemName: "arrow.left")
                                }
                                Spacer()
                                Button(action: {
                                    self.date = Calendar.current.date(byAdding: .month, value: 1, to: self.date)!
                                }) {
                                    Image(systemName: "arrow.right")
                                }
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                        }
                        .background(Color.red)
                        
                        Text(self.data.Date)
                            .font(.system(size: 65))
                            .fontWeight(.bold)
                        
                        Text(self.data.Day)
                            .font(.title)
                        
                        Divider()
                        
                        ZStack {
                            Text(self.data.Year)
                                .font(.title)
                            
                            HStack {
                                Spacer()
                                
                                Button(action: {
                                    withAnimation(.default) {
                                        self.expand.toggle()
                                    }
                                }) {
                                    Image(systemName: "chevron.right")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 10, height: 16)
                                        .rotationEffect(.init(degrees: self.expand ? 270 : 90))
                                }
                                .padding(.trailing, 30)
                            }
                        }
                        if self.expand {
                            Toggle(isOn: self.$year) {
                                Text("Year")
                                    .font(.title)
                            }
                            .padding(.trailing, 15)
                            .padding(.leading, 25)
                        }
                    }
                    .padding(.bottom, self.expand ? 15 : 12)
                    
                    HStack {
                        Button(action: {
                            self.date = Calendar.current.date(byAdding: self.year ? .year : .day, value: -1, to: self.date)!
                            
                            self.UpdateDate()
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                        }
                        Spacer()
                        
                        Button(action: {
                            self.date = Calendar.current.date(byAdding: self.year ? .year : .day, value: 1, to: self.date)!
                            
                            self.UpdateDate()
                        }) {
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, 30)
                }
                .frame(width: UIScreen.main.bounds.width / 1.5)
                .background(Color.white)
                .cornerRadius(15)
            }
        }
        .onAppear {
            // automatic update for date change
            self.date = Date()
            self.UpdateDate()
        }
    }
    func UpdateDate() {
        let current = Calendar.current
        
        let date = current.component(.day, from: self.date)
        let monthNO = current.component(.month, from: self.date)
        let month = current.monthSymbols[monthNO - 1]
        let year = current.component(.year, from: self.date)
        let weekno = current.component(.weekday, from: self.date)
        let day = current.weekdaySymbols[weekno - 1]
        
        self.data = DateType(Day: day, Date: "\(date)", Year: "\(year)", Month: month)
    }
}

struct DateType {
    var Day: String
    var Date: String
    var Year: String
    var Month: String
}
