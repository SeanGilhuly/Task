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
    
    // MARK: - Fetech

    let fetchedResultsController: NSFetchedResultsController
    
    init() {
        let request = NSFetchRequest(entityName: "Task")
        let compeletedSortDescriptor = NSSortDescriptor(key: "isComplete", ascending: false)
        let dueSortDescriptor = NSSortDescriptor(key: "due", ascending: false)
        request.sortDescriptors = [compeletedSortDescriptor, dueSortDescriptor]
        
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: Stack.sharedStack.managedObjectContext, sectionNameKeyPath: "isComplete", cacheName: nil)
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error trying to save")
        }
        
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
        
    func updateTask(task: Task, name: String, notes: String?, due: NSDate?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
    }
        
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
        print("There was an error trying to save")
        }
    }
    
    func isCompleteValueToggle(task: Task) {
        task.isComplete = !task.isComplete.boolValue
        saveToPersistentStore()
    }
}