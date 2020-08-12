//
//  MainView.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/24.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI
import CoreData

struct MainView: View {
    
    @ObservedObject var taskStore: TaskStore = TaskStore(tasks: [])
    
    // @Binding var showSideMenu: Bool
    @State var searchbar: String = ""
    @State var placeholder: String = "search task!!!"
    @State var index = 0
    @State var date = Date()
    
    @State var showSideMenu = false
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showSideMenu = false
                    }
                }
            }
        
        return NavigationView {
            ZStack(alignment: .leading) {
                    VStack {
                      
                        // Spacer()
                        
                        CalendarView(date: $date)
                            //.padding(.top, 45)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                
                                HStack {
                                    
                                    Image(systemName: self.searchbar != "" ? "magnifyingglass" :  "book.fill").foregroundColor(.secondary)
                                    
                                    TextField(self.placeholder, text: self.$searchbar)
                                    
                                    // Image(systemName: self.searchbar != "" ? )
                                    
                                    if self.searchbar != "" {
                                        Image(systemName: "xmark.circle.fill")
                                            .imageScale(.medium)
                                            .foregroundColor(Color(.systemGray3))
                                            // .padding(.leading, 320)
                                            // .padding(.trailing, 30)
                                            .padding(3)
                                            .onTapGesture {
                                                withAnimation{
                                                    self.searchbar = ""
                                                }
                                            }
                                    }
                                    else {
                                        Image(systemName: "magnifyingglass")
                                            .imageScale(.medium)
                                            .foregroundColor(Color(.systemGray3))
                                            // .padding(.leading, 320 )
                                            // .padding(.trailing, 30)
                                            .padding(3)
                                    }
                                }
                                .padding(10)
                                .background(Color(.systemGray6))
                                .cornerRadius(30) // 12
                                .padding(.all, 10)
                                
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 20) {
                                        ForEach(0 ..< 7 ) {i in
                                            GeometryReader { geometry in
                                                    circleImage()
                                                        // .rotation3DEffect(Angle(degrees: 30), axis: (x: 10.0, y: 10, z: 10.0))
                                                        .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 40) / 10), axis: (x: 0, y: 50, z: 50))
                                            }
                                            .frame(width: 230, height: 250)
                                        }// .frame(width: 300, height: 300)
                                    }
                                    .padding(40)
                                    // Spacer()
                                }
                                .frame(width: UIScreen.main.bounds.width, height: 250)
                                .padding(.top, 10)
                                
                                VStack {
                                    HStack {
                                        Text("Task")
                                            .font(.title)
                                            .fontWeight(.bold)
                                        Spacer(minLength: 0)
                                    }
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                                    
                                    HStack {
                                        Text("today")
                                            .foregroundColor(self.index == 0 ? .white : Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(0.7))
                                            .fontWeight(.bold)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 35)
                                            .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(self.index == 0 ? 1 : 0))
                                            .clipShape(Capsule())
                                            .onTapGesture {
                                                withAnimation {
                                                     self.index = 0
                                                }
                                            }
                                        Spacer(minLength: 0)
                                        Text("Future")
                                            .foregroundColor(self.index == 1 ? .white : Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(0.7))
                                            .fontWeight(.bold)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 35)
                                            .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(self.index == 1 ? 1 : 0))
                                            .clipShape(Capsule())
                                            .onTapGesture {
                                                withAnimation{
                                                    self.index = 1
                                                }
                                            }
                                    }
                                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.06))
                                    .clipShape(Capsule())
                                    .padding(.horizontal)
                                    .padding(.top, 25)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack {
                                            ForEach(0 ..< self.taskStore.tasks.count, id: \.self) { i in
                                                HStack {
                                                    VStack {
                                                        Text("\(self.taskStore.tasks[i].work)")
                                                        Text("\(self.taskStore.tasks[i].date, formatter: self.taskDateFormat())")
                                                    }
                                                    Spacer(minLength: 0)
                                                    Text("\(self.taskStore.tasks[i].description)")
                                                }
                                                .foregroundColor(.white)
                                                .frame(width: 200, height: 200)
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 20)
                                                .background(Color.black)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                            }
                                        }
                                        .padding()
                                    }
                                    
                                    Button(action: {
                                        self.taskStore.tasks.append(Task(id: UUID().uuidString, work: "Test", date: Date(), description: "Description Test"))
                                        
                                        self.showSideMenu.toggle()
                                        print("add Main View Task")
                                    }) {
                                        Text("Add")
                                    }
                                }
                                Spacer(minLength: 0)
                            }
                        }
                        
                        // .edgesIgnoringSafeArea(.top)
                        // .frame(width: UIScreen.main.bounds.width, height: 460)
                        
                        
                    }
                    // .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 130)
                    .offset(x: self.showSideMenu ? UIScreen.main.bounds.width / 2 : 0)
                    .disabled(self.showSideMenu ? true : false)
                    
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                    // .edgesIgnoringSafeArea(.top)
                    .onAppear {
                        self.getTasks()
                    }
                    
                    if self.showSideMenu {
                        SideMenu()
                            // .frame(width: geo.size.width / 2)
                            .frame(width: UIScreen.main.bounds.width / 2)
                            .transition(.move(edge: .leading))
                            .edgesIgnoringSafeArea(.top)
                    }
                    
                }
            
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(leading: Button(action: {
                withAnimation {
                    self.showSideMenu.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .font(.largeTitle)
            }, trailing: Button(action: {}) {
                Image(systemName: "square.and.pencil")
                    .font(.largeTitle)
            })
            //.edgesIgnoringSafeArea(.all)
            .gesture(drag)
            .onTapGesture {
                withAnimation {
                    self.showSideMenu = false

                    // ToDoMain.getTasks()
                    print("onTapGesture")
                }
            }
        }
        
    }
    func hello() {
        print("Hello")
    }
    func buildMessageFor(_ name: String, _ count: Int) -> String {
        return "\(name), you are a customer number \(count)"
    }
    func taskDateFormat() -> DateFormatter {
        let formatter = DateFormatter()
        // formatter.dateFormat = "dd-MM-YYYY"
        // formatter.dateFormat = "HH : mm"
        // formatter.timeStyle = .long
        formatter.dateStyle = .long
        return formatter
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
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        // MainView(showSideMenu: false)
        // MainView(searchbar: "", placeholder: "placeholder")
        MainView()
    }
}

struct circleImage: View {
    var body: some View {
            Image("ㅇㅇㅇ")
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
//            Text("1")
//                .padding(.top, 200)
//                .padding(.leading, 200)
    }
}


struct MainTopView: View {
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    // self.showSideMenu.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .font(.title)
            }

            Spacer(minLength: 0)

            VStack {
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("To Do")
            }

            Spacer(minLength: 0)

            Button(action: {}) {
                Image(systemName: "square.and.pencil")
                    .font(.title)
            }
        }
    }
}
