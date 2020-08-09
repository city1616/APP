//
//  test.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/08/03.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit
import FSCalendar

struct test: View {
//
//    @Binding var version: String
    @State var input = ""
    @State var date = Date()
//    @Binding var date: Date
//    var title: String
//
//    @State private var showVersionPicker = false
//    @State private var showDatePicker = false
//
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        return formatter
//    }
//    private func showDate() {
//        showDatePicker = true
//    }
    
    var body: some View {
        Text("a")
        
//            HStack(alignment: .center) {
//                Text("Test")
//                    .font(.system(size: 14))
//
//                HStack(alignment: .center) {
//                    TextField("empty", text: $input)//  {
////                        self.version = self.input
////                    }
//                    .font(.system(size: 9))
//                    .padding(.leading, 20)
//                    .frame(width: 100, height: 20)
//
//                    NavigationLink(destination: EmptyView()) {
//                        Image(systemName: "line.horizontal.3")
//                            .frame(width: 24, height: 14)
//                            .aspectRatio(contentMode: .fill)
//                    }
//                    .offset(x: -20)
//
//                }
//                .frame(width: 100, height: 25)
//                .border(Color.gray, width: 0.5)
//                .padding(.leading, 40)
//
//                NavigationLink(destination: EmptyView()) {
//                    HStack {
////                        Text(dateFormatter.string(from: date))
////                            .font(.system(size: 9))
////                            .padding(.leading, 10)
//                        Image(systemName: "gear")
//                    }
//                    .frame(width: 100, height: 25)
//                    .border(Color.gray, width: 0.5)
//                    .padding(.leading, 40)
//                }
//
//
//            }
//            .padding(.bottom.10)
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        CalendarViewTest(date: .constant(Date()))
    }
}

struct CalendarViewTest : UIViewRepresentable {


    @Environment(\.presentationMode) var presentationMode

    @Binding var date: Date

    init(date: Binding<Date>) {
    self._date = date

    }

    func makeUIView(context: UIViewRepresentableContext<CalendarViewTest>) -> UIView {
    let view = UIView(frame: UIScreen.main.bounds)
            // view.backgroundColor = .backgroundTheme

    let height: CGFloat = 300.0
    let width = view.frame.size.width
    let frame = CGRect(x: 0.0, y: 0.0, width: width, height: height)
    let calendar = FSCalendar(frame: frame)
            calendar.locale = Locale.init(identifier: "ZH-CN")
            calendar.delegate = context.coordinator
            context.coordinator.fsCalendar = calendar
            calendar.backgroundColor = UIColor.white
            view.addSubview(calendar)

    return view
        }

    func makeCoordinator() -> CalendarViewTest.Coordinator {
    Coordinator(self)
        }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<CalendarViewTest>) {
            // log.debug("Date")


            context.coordinator.fsCalendar?.select(date)

        }


    func dismiss() {
            presentationMode.wrappedValue.dismiss()
        }

    class Coordinator: NSObject, FSCalendarDelegate {
    var control: CalendarViewTest
    var date: Date
    var fsCalendar: FSCalendar?
    init(_ control: CalendarViewTest) {
        self.control = control
        self.date = control.date
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.control.date = date
        }

    }
}



struct TestHome: View {
    
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
