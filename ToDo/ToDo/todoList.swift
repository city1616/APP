//
//  todoList.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/20.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

struct todoList: View {
    var body: some View {
        NavigationView {
            List() {
                Text("first")
            }
        }
    }
}

struct todoList_Previews: PreviewProvider {
    static var previews: some View {
        todoList()
    }
}
