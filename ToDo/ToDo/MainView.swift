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
        
        return GeometryReader { _ in
            ZStack(alignment: .leading) {
                VStack {
                    
                    HStack {
                        Button(action: {
                            withAnimation {
                                self.showSideMenu.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title)
                        }
    //                    .animation(.default)
//                        Image(systemName: "line.horizontal.3")
//                            .font(.title)
//                            .onTapGesture {
//                                withAnimation {
//                                    self.showSideMenu.toggle()
//                                }
//                            }

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
                    .padding(.horizontal)
                    .padding(.top, 45)
                        
                    
                    // .padding(.vertical)
                    
                    CalendarView(date: $date)
                    
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
                //                                }
                                           // }
                                        }
                                        .frame(width: 246, height: 250)
                                    }
                                    // .frame(width: 300, height: 300)
                                }
                                .padding(40)
                                // Spacer()
                            }
        //                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        //                        .edgesIgnoringSafeArea(.top)
                                .frame(width: UIScreen.main.bounds.width, height: 250)
                                .padding(.top, 10)
                                // .padding(40)
                            // gradientViewTest()
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
                                        }                                    }
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
                    
                    Spacer()
                }
                
                // .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 130)
                .offset(x: self.showSideMenu ? UIScreen.main.bounds.width / 2 : 0)
                .disabled(self.showSideMenu ? true : false)
                .onTapGesture {
                    withAnimation {
                        self.showSideMenu = false
                        
                        // ToDoMain.getTasks()
                        print("onTapGesture")
                    }
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.top)
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
            .gesture(drag)
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

struct Home: View {
    
    // for stichy header view
    @State var time = Timer.publish(every: 0.1, on: .current, in: .tracking).autoconnect()
    
    @State var show = false
    
    var body: some View {
        ZStack(alignment: .top, content: {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    // now going to do strechy header
                    
                    GeometryReader { g in
                        Image("ㅇㅇㅇ")
                            .resizable()
                            // .aspectRatio(contentMode: .fit)
                            // fixing the view to the top will give strechy effect
                            // increasing height by drag amount
                            .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                            .frame(height: g.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height / 2.2 + g.frame(in: .global).minY : UIScreen.main.bounds.height / 2.2)
                            .onReceive(self.time) {(_) in
                                
                                // for tracking the image is scrolled out or not
                                let y = g.frame(in: .global).minY
                                if -y > (UIScreen.main.bounds.height / 2.2) - 50 {
                                    // print("hello")
                                    withAnimation {
                                        self.show = true
                                    }
                                }
                                else {
                                    withAnimation {
                                        self.show = false
                                    }
                                }
                                print(g.frame(in: .global).minY)
                        }
                        
                    }
                    // fixing default height
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    VStack {
                        HStack {
                            Text("New Home")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                            Button(action: {
                                
                            }) {
                                Text("See All")
                                    .fontWeight(.bold)
                            }
                        }
        //                // testing data..
        //                CardView(data: data[0])
                        VStack(spacing: 20) {
                            ForEach(data) { i in
                                CardView(data: i)
                            }
                        }
                        .padding(.top)
                    }
                    .padding()
                    
                    Spacer()
                }
            })
            
            if self.show {
                TopView()
            }
        })
            
        .edgesIgnoringSafeArea(.top)
    }
}

// CardView...
struct CardView: View {
    
    var data: Card
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(self.data.image)
                .resizable()
                .frame(width: 80, height: 80)
            VStack(alignment: .leading, spacing: 6) {
                Text(self.data.title)
                    .fontWeight(.bold)
                Text(self.data.subTitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                HStack(spacing: 12) {
                    Button(action: {}) {
                        Text("Get")
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            // for adapting to dark mode ...
                            .background(Color.primary.opacity(0.06))
                            .clipShape(Capsule())
                    }
                    Text("In-App\n Purchases")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            Spacer(minLength: 0)
        }
    }
}

// TopView...
struct TopView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    Image("ㅇㅇㅇ")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 25, height: 30)
                        // for dark mode adaption
                        .foregroundColor(.primary)
                    
                    Text("IU")
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
                Text("IUIUIUIUIUIU")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 0)
            
            Button(action: {}) {
                Text("Try It Free")
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color.blue)
                    .clipShape(Capsule())
                
            }
        }
            // for non safe area phones padding will be 15
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top == 0 ? 15 : (UIApplication.shared.windows.first?.safeAreaInsets.top)!  + 5)
        .padding(.horizontal)
        .padding(.bottom)
        .background(BlurBG())
    }
}

// Blur background
struct BlurBG: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        // for dark mode adaption
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}


// sample data for cards...
struct Card: Identifiable {
    var id: Int
    var image: String
    var title: String
    var subTitle: String
}
var data = [
    Card(id: 0, image: "ㅇㅇㅇ", title: "Zombie Gunship Survival", subTitle: "Tour the apocalypse"),
    Card(id: 1, image: "ㅇㅇㅇ", title: "Portal", subTitle: "Travel through dimensions"),
    Card(id: 2, image: "ㅇㅇㅇ", title: "Wave Form", subTitle: "Fun enagaging wave game"),
    Card(id: 3, image: "ㅇㅇㅇ", title: "Temple Run", subTitle: "Run for your life"),
    Card(id: 4, image: "ㅇㅇㅇ", title: "World of Warcraft", subTitle: "Be whoever you want"),
    Card(id: 5, image: "ㅇㅇㅇ", title: "Alto's Adventure", subTitle: "A snowboarding odyssey"),
    Card(id: 6, image: "ㅇㅇㅇ", title: "Space Frog", subTitle: "Jump and have fun"),
    Card(id: 7, image: "ㅇㅇㅇ", title: "Dinosaur Mario", subTitle: "Keep running")
    
]

struct gradientViewTest: View {
    var body: some View {
        VStack {
            Image("ㅇㅇㅇ")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            Text("Test")
        }
        .padding(.all, 30)
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}
