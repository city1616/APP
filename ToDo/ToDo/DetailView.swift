//
//  DetailView.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/22.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var work: String
    var date: Date
    var body: some View {
        VStack {
            Text("current name is \(work)")
            HStack {
                Text("Date")
                Spacer()
                Text("\(date)")
            }.padding()
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(work: "t", date: Calendar.d)
//    }
//}
