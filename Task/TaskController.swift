//
//  TaskController.swift
//  Task
//
//  Created by Sean Gilhuly on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    // MARK: - Shared Controller - Singleton
    
    static let sharedController = TaskController()
    
    // MARK: - Task Property

    var tasks: [Task] = []
    
    init() {
        self.tasks = fetchTasks()
    }
    
    // MARK: - Computed Properties
    
    var completedTasks: [Task] {
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        let tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        return tasks.filter({$0.isComplete.boolValue})
    }
    
    var incompleteTasks: [Task] {
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        let tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        return tasks.filter({!$0.isComplete.boolValue})
    }
    
    // MARK: - Mock Data
    
    var mockTasks: [Task] {
        guard let task1 = Task(name: "Sean"),
        let task2 = Task(name: "Bob"),
            let task3 = Task(name: "Steve") else { return [] }
        
        return [task1, task2, task3]
    }
    
    // MARK: - CRUD Functions
        
    func addTask(name: String, notes: String?, due: NSDate?) {
        _ = Task(name: name, notes: notes)
        saveToPersistentStore()
    }
        
    func removeTask(task: Task) {
        if let moc = task.managedObjectContext {
        moc.deleteObject(task)
        saveToPersistentStore()
        }
    }
        
    func updateTask(task: Task, name: String, notes: String?, due: NSDate?, isComplete: Bool) {
            
    }
        
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
        print("There was an error trying to save")
        }
    }
        
    func fetchTasks() -> [Task] {
        return mockTasks
    }
}