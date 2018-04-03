//
//  DataManager.swift
//  ToDo
//
//  Created by Jesse Tipton on 2/19/18.
//  Copyright © 2018 MattRuston. All rights reserved.
//

import Foundation
import RealmSwift

class DataManager {
    
    // Single instance of DataManger shared across the app.
    static let shared = DataManager()
    private let realm = try! Realm()
    
    // Properties
    
    var tasks: Results<Task> {
        return realm.objects(Task.self)
    }
    
    func add(task: Task) {
        try! realm.write {
            realm.add(task)
        }
    }
    
    func removeTask(at index: Int) {
        let task = tasks[index]
        
        try! realm.write {
            realm.delete(task)
        }
    }
    
    func getTask(at index: Int) -> Task {
        return tasks[index]
    }
    
    func numberOfTasks() -> Int {
        return tasks.count
    }
    
    func toggleTask(at index: Int) {
        let task = tasks[index]
        try! realm.write {
            task.done = !task.done
        }
        
        // doesn't work, task is a copy
//        let task = tasks[index]
//        task.done = !task.done
    }
    
    
    
    
    
    
    
    
    
}
