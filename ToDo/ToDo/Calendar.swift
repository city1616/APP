//
//  Calendar.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/20.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI
import FSCalendar
//import Foundation
import UIKit

struct Calendar: View {
    @State var selectDate = Date()
    @State var colorPick: Color = Color.purple
    @State var pop = false
//    let formatter = DateFormatter()
//    formatter.dateFormat = "mm/dd/yyyy"

    let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
    
    var body: some View {
//        VStack {
//
//            Spacer()
//        }
        VStack {
            
            Form {
                Section(header: Text("Due Date").fontWeight(.bold)) {
                    DatePicker("When is your birthday?", selection: $selectDate, displayedComponents: .date)
                        // .labelsHidden() // Text 숨기기
                        .foregroundColor(.green)
                        // .background(with: .black)
                }
                .foregroundColor(.pink)
                
                Section(header: Text("Date")) {
                    DatePicker("", selection: $selectDate, displayedComponents: .date)
                    Text("Your selected date: \(selectDate, formatter: self.DateFormat())")
                        .foregroundColor(.pink)
                        .fontWeight(.bold)
                        // .background(Color.green)
                }
                
                Section(header: Text("Date")) {
                    DatePicker("", selection: $selectDate)
                    Text("Your selected date: \(selectDate, formatter: self.DateFormat())")
                        .foregroundColor(.pink)
                        .fontWeight(.bold)
                        // .background(Color.green)
                }
                
                Section(header: Text("Color Pick")) {
                    ColorPicker("Color", selection: $colorPick)
                }
                
                Section() {
                    Button(action: {
                        self.pop.toggle()
                    }) {
                        Text("View Calendar")
                    }.sheet(isPresented: $pop) {
                        CalendarView(date: $selectDate)
                    }
                }
          
            }
            // .background(Color.blue)
           
            
            Spacer()
        }
    }
    func DateFormat() -> DateFormatter {
        let formatter = DateFormatter()
        // formatter.dateFormat = "dd-MM-YYYY"
        // formatter.dateFormat = "HH : mm"
        // formatter.timeStyle = .long
        formatter.dateStyle = .long
        return formatter
    }
    
//    fileprivate weak var calendar: FSCalendar! {
//        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
//        calendar.dataSource = self
//        calendar.delegate = self
//        view.addSubview(calendar)
//        self.calendar = calendar
//    }
    
    
    
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}

struct CalendarView: UIViewRepresentable {
    // @Environment(\.presentationMode) var presentationMode
    @Binding var date: Date
    
    init(date: Binding<Date>) {
        self._date = date
    }
    
    func makeUIView(context: UIViewRepresentableContext<CalendarView>) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        let height: CGFloat = 300.0
        let width = view.frame.size.width
        let frame = CGRect(x: 0.0, y: 0.0, width: width, height: height)
        let calendar = FSCalendar(frame: frame)
        calendar.locale = Locale.init(identifier: "KO-ko")
        calendar.delegate = context.coordinator
        context.coordinator.fsCalendar = calendar
        calendar.backgroundColor = UIColor(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
        calendar.scrollDirection = .vertical
        view.addSubview(calendar)
        
        return view
    }
    func makeCoordinator() -> CalendarView.Coordinator {
        Coordinator(self)
    }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<CalendarView>) {
        context.coordinator.fsCalendar?.select(date)
    }
//    func dismiss() {
//        presentationMode.wrappedValue.dismiss()
//    }
    class Coordinator: NSObject, FSCalendarDelegate {
        var control: CalendarView
        var date: Date
        var fsCalendar: FSCalendar?
        init(_ control: CalendarView) {
            self.control = control
            self.date = control.date
        }
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            self.control.date = date
        }
//        func calendar(calendar: FSCalendar!, hasEventForDate date: NSDate!) -> Bool {
//            return shouldShowEventDot
//        }
    }
}
