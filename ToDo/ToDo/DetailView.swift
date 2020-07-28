//
//  DetailView.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/22.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var work: working
    
    var body: some View {
        Form {
            Section(header: Text("Work")) {
                HStack {
                    Text("할일")
                    Spacer()
                    Text(work.work)
                }
            }
            Section(header: Text("DATE")) {
                HStack {
                    Text("Date")
                    Spacer()
                    Text("\(work.date)")
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
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(work: working())
    }
}
