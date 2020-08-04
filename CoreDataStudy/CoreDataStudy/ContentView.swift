//
//  ContentView.swift
//  CoreDataStudy
//
//  Created by SeungWoo Mun on 2020/08/04.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        Text("Hello, world!").padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    // stateobject is parent of the object
    @StateObject var model = dataModel()
    
    var body: some View {
        VStack {
            List(model.data, id: \.objectID) { obj in
                
                // extracting data from object
                Text("a")
            }
        }
    }
}

// MVVM Pattern
class dataModel: ObservableObject {
    @Published var data: [NSManagedObject] = []
    @Published var txt = ""
    
    init() {
        
    }
    
    func readData() {
        
    }
    
    func writeData() {
        
    }
    
    func deleteData() {
        
    }
    
    func updateData() {
        
    }
    
    func getValue(obj: NSManagedObject) -> String {
        return obj.value(forKey: "value") as! String
    }
}
