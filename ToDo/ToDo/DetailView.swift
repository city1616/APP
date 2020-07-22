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
    var body: some View {
        Text("current name is \(work)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(work: "t")
    }
}
