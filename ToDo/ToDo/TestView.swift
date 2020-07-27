//
//  TestView.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/27.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ZStack {
            MainView()
            Menu()
            
            Text("a")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
