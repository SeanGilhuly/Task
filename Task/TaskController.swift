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
    
//    // MARK: - Mock CoreData
//    
//    var mockTasks:[Task] {
//        let task1 = Task(name: "sean", notes: "test")
//        let task2 = Task(name: "bob")
//        
//        return [task1, task2]
//    }
//    
    
    
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
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
        
    }
    
    func removeTask(task: Task) {
        if let moc = task.managedObjectContext {
            moc.deleteObject(task)
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("There was a problem saving to persistent store")
        }
    }
    
    func fetchTasks() -> [Task] {
        let request = NSFetchRequest(entityName: "Task")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        return (try? moc.executeFetchRequest(request)) as? [Task] ?? []
    }
    
    func updateTask(task: Task, name: String, notes: String?, due: NSDate?) {
        task.name = name
        task.notes = notes
        task.due = due
    }
   
    
    
}




