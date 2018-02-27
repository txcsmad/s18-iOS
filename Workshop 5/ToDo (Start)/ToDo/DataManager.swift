//
//  DataManager.swift
//  ToDo
//
//  Created by Jesse Tipton on 2/19/18.
//  Copyright © 2018 MattRuston. All rights reserved.
//

import Foundation

class DataManager {
    
    // Single instance of DataManger shared across the app.
    static let shared = DataManager()
    
    // Properties
    
    var tasks = [Task]()
    
    func add(task: Task) {
        tasks.append(task)
    }
    
    func removeTask(at index: Int) {
        tasks.remove(at: index)
    }
    
    func getTask(at index: Int) -> Task {
        return tasks[index]
    }
    
    func numberOfTasks() -> Int {
        return tasks.count
    }
    
    func toggleTask(at index: Int) {
        tasks[index].done = !tasks[index].done
        
        // doesn't work, task is a copy
//        let task = tasks[index]
//        task.done = !task.done
    }
    
    
    
    
    
    
    
    
    
}
