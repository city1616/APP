//
//  Calendar.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/20.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct Calendar: View {
    @State var selectDate = Date()
    
    var body: some View {
//        VStack {
//
//            Spacer()
//        }
        VStack {
            Form {
                Section(header: Text("Due Date").fontWeight(.bold)) {
                    DatePicker("When is your birthday?", selection: $selectDate, displayedComponents: .date)
                        // .labelsHidden()
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
          
            }
            .frame(height: 350)
            .background(Color.blue)
           
            
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
    
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}
