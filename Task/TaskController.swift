//
//  TaskController.swift
//  Task
//
//  Created by Sean Gilhuly on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let sharedController = TaskController()
    
    var tasks: [Task] = []
    
    init() {
        self.tasks = fetchTasks()
    }
    
    // MARK: - Mock CoreData
    
    var mockTasks:[Task] {
        let task1 = Task(name: "name")
        let task2 = Task(name: "bob")
        
        return [task1, task2]
    }
    
    
    
    // MARK: - Computed Array
    var completedTasks: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        let tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        let completedTasks = tasks.filter({$0.isComplete == true})
        return completedTasks
    }
    
    var incompleteTasks: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
            
        let moc = Stack.sharedStack.managedObjectContext
            
        let tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
            let incompleteTasks = tasks.filter({$0.isComplete == false})
            return incompleteTasks
    }
    
    // MARK: - Functions
    
    func addTask(name: String, notes: String?, due: NSDate?) {
        
    }
    
    func removeTask(task: Task) {
        
    }
    
    func updateTask(task: Task, name: String, notes: String?, due: NSDate?, isComplete: Bool) {
        
    }
    
    func saveToPersistentStore() {
        
    }
    
    func fetchTasks() -> [Task] {
    return mockTasks
    }
    
    func updateWithTask(task: Task) {
        
    }
    
    
}




