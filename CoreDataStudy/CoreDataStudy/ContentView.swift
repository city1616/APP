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
        // Text("Hello, world!").padding()
        NavigationView {
            Home()
                .navigationTitle("HOME")
                .navigationBarTitleDisplayMode(.inline)
        }
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
            List {
                ForEach(model.data, id: \.objectID) { obj in
                    // extracting data from object
                    Text(model.getValue(obj: obj))
                        .onTapGesture {model.openUpdateView(obj: obj)}
                }
                .onDelete(perform: model.deleteData)
            }
            .listStyle(InsetGroupedListStyle())
            
            HStack(spacing: 15) {
                TextField("Data Here", text: $model.txt)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: model.writeData) {
                    Image(systemName: "circle")
                }
            }
            .padding()
        }
        .sheet(isPresented: $model.isUpdate) {
            // Update View
            UpdateView(model: model)
        }
    }
}

struct UpdateView: View {
    
    @ObservedObject var model: dataModel
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Update Here", text: $model.updateTxt)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: model.updateData) {
                Text("Update")
            }
        }
        .padding()
    }
}

// MVVM Pattern
class dataModel: ObservableObject {
    @Published var data: [NSManagedObject] = []
    @Published var txt = ""
    @Published var isUpdate = false
    @Published var updateTxt = ""
    @Published var selectedObj = NSManagedObject()
    
    let context = persistentContainer.viewContext
    
    init() {
        readData()
    }
    
    func readData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data")
        
        do {
            let results = try context.fetch(request)
            
            self.data = results as! [NSManagedObject]
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
    
    func writeData() {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Data", into: context)
        
        entity.setValue(txt, forKey: "value")
        
        do {
            try context.save()
            
            // if success means append data to list
            self.data.append(entity)
        }
        catch {
            print(error.localizedDescription)
        }
        
        txt = ""
    }
    
    func deleteData(indexSet: IndexSet) {
        for index in indexSet {
            do {
                let obj = data[index]
                
                context.delete(obj)
                
                try context.save()
                
                // if success means removing data from list
                let index = data.firstIndex(of: obj)
                
                data.remove(at: index!)
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func updateData() {
        // Updating and closing View
        
        // finding index
        let index = data.firstIndex(of: selectedObj)
        
        // Fetching and updating data
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data")
        
        do {
            let results = try context.fetch(request) as! [NSManagedObject]
            
            // updating data
            
            let obj = results.first { (obj) -> Bool in
                if obj == selectedObj {
                    return true
                }
                else {
                    return false
                }
            }
            obj?.setValue(updateTxt, forKey: "value")
            
            // saving
            try context.save()
            
            // if success means update and close the view
            data[index!] = obj!
            isUpdate.toggle()
            updateTxt = ""
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func getValue(obj: NSManagedObject) -> String {
        return obj.value(forKey: "value") as! String
    }
    
    func openUpdateView(obj: NSManagedObject) {
        selectedObj = obj
        isUpdate.toggle()
    }
}
