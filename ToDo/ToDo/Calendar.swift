//
//  Calendar.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/20.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI
import FSCalendar

struct Calendar: View {
    @State var selectDate = Date()
    @State var colorPick: Color = Color.purple
    
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
