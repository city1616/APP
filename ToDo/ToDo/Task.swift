//
//  Task.swift
//  ToDo
//
//  Created by SeungWoo Mun on 2020/07/28.
//  Copyright © 2020 SeungWoo Mun. All rights reserved.
//

import SwiftUI
import Combine

struct Task: Codable, Identifiable {
    var id: String
    var work: String
    var date = Date()
    
    var description: String
}

// var taskData: [Task] = []

class TaskStore: ObservableObject {
    @Published var tasks: [Task]
    init(tasks: [Task] = []) {
        self.tasks = tasks
    }
}
