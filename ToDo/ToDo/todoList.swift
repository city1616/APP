//
//  todoList.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/20.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI

//struct ToDo: Identifiable {
//    var id = UUID()
//    // var date = String()
//    var work = String()
//    // var Done = String()
//}

struct working: Identifiable {
    var id = UUID()
    var work = String()
}

//struct ToDoRow: View {
//    var todo: ToDo
//
//    var body: some View {
//        Text("\(todo.id). \(todo.work)")
//    }
//}

struct todoList: View {
    var t: [working] = [working(work: "first"), working(work: "second")]
    
    var body: some View {
        
        NavigationView {
            List(t) { todolist_t in
                NavigationLink(destination: DetailView(work: todolist_t.work)) {
                    VStack(alignment: .leading) {
                        Text(todolist_t.work)
                    }
                }
                // Text("first")
            }
//            List {
//                Text("a")
//            }
            .navigationBarTitle(Text("ToDo"))
            .navigationBarItems(leading:
                HStack {
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
            }, trailing:
                NavigationLink(destination: todo()) {
                    HStack {
                        Image(systemName: "square.and.pencil")
                            .font(.title)
                    // .foregroundColor(Color(.quaternarySystemFill))
                    }
            })
        }
    }
}

struct todoList_Previews: PreviewProvider {
    static var previews: some View {
        todoList()
            .colorScheme(.dark)
    }
}
