//
//  ListView.swift
//  SwiftUIDemo
//
//  Created by SeungWoo Mun on 2020/07/28.
//

import SwiftUI

struct ToDoItem: Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}

var listData: [ToDoItem] = [
    ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
    ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
    ToDoItem(task: "Wash the car", imageName: "car.fill")
]

struct ListView: View {
    
    @State var toggleStatus = true
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Settings")) {
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notifications")
                    }
                }
                
                Section(header: Text("To Do Tasks")) {
                    ForEach(listData) { item in
                        HStack {
                            NavigationLink(destination: Text(item.task)) {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
            }
            .navigationBarTitle(Text("To Do List"))
            .navigationBarItems(trailing: EditButton())
        }
//        List(listData) { item in
//            HStack {
//                Image(systemName: item.imageName)
//                Text(item.task)
//            }
//        }
//        List {
//            HStack {
//                Image(systemName: "trash.circle.fill")
//                Text("Wash the car")
//            }
//            HStack {
//                Image(systemName: "person.2.fill")
//                Text("Vacuum house")
//            }
//            HStack {
//                Image(systemName: "car.fill")
//                Text("Pick up kids from school bus @ 3pm")
//            }
//            HStack {
//                Image(systemName: "line.horizontal.3")
//                Text("Auction the kids on eBay")
//            }
//            HStack {
//                Image(systemName: "calendar")
//                Text("Order Pizza for dinner")
//            }
//        }
    }
    func deleteItem(at offsets: IndexSet) {
        // 데이터 소스에서 항목을 삭제하는 코드
    }
    func moveItem(from source: IndexSet, to destination: Int) {
        // 항목을 재배열하는 코드
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
