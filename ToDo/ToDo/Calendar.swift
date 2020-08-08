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
                Section(header: Text("Due Date")) {
                    DatePicker("When is your birthday?", selection: $selectDate, displayedComponents: .date)
                        // .labelsHidden()
                        .foregroundColor(.green)
                        // .background(with: .black)
                }
                
                DatePicker("", selection: $selectDate, displayedComponents: .date)
                Text("Your selected date: \(selectDate)")
                    .foregroundColor(.red)
                    .background(Color.green)
                
                Spacer(minLength: 0)
                
            }
            .frame(height: 350)
            .background(Color.blue)
           
            
            Spacer()
        }
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}
