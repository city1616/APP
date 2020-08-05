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
                .navigationBarItems(trailing: EditButton())
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
                    HStack(spacing: 15) {
                        Text(model.getValue(obj: obj))
                            .onTapGesture {model.openUpdateView(obj: obj)}
                    
                        Text("\(model.getDate(obj: obj), formatter: model.dateFormat())")
                    }
                }
                .onDelete(perform: model.deleteData)
                .onMove(perform: model.moveData)
            }
            .listStyle(InsetGroupedListStyle())
            
            VStack {
                HStack(spacing: 15) {
                    TextField("Data Here", text: $model.txt)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: model.writeData) {
                        Image(systemName: "circle")
                    }
                }
                .padding()
                
                HStack {
                    DatePicker("Date", selection: $model.date, displayedComponents: .date)
                }
            }
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
    
    @Published var date = Date()
    
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
        entity.setValue(date, forKey: "due")
        
        do {
            try context.save()
            
            // if success means append data to list
            self.data.append(entity)
        }
        catch {
            print(error.localizedDescription)
        }
        
        txt = ""
        date = Date()
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
    
    func getDate(obj: NSManagedObject) -> Date {
        let date = obj.value(forKey: "due") as! Date
        return date  // obj.value(forKey: "due") as! Date
    }
    
    func openUpdateView(obj: NSManagedObject) {
        selectedObj = obj
        isUpdate.toggle()
    }
    
    func moveData(from source: IndexSet, to destination: Int) {
        // taskStore.tasks.move(fromOffsets: source, toOffset: destination)
        data.move(fromOffsets: source, toOffset: destination)
    }
    
    func dateFormat() -> DateFormatter {
        let formatter = DateFormatter()
        
        formatter.dateStyle = .long
        return formatter
    }
}
