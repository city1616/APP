//
//  Menu.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/20.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        NavigationView {
            List() {
                Text("1. ")
                Text("2. ")
            }
        .navigationBarTitle("Menu")
        }
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
