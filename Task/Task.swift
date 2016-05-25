//
//  Task.swift
//  Task
//
//  Created by Sean Gilhuly on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class Task: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init?(name: String, notes: String? = nil, due: NSDate? = nil, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        // there is no graceful way to respond to a failure on NSEntityDescription.entityForName, force unwrapping and forcing a crash is the desired behavior for this app
        
        // designated initializer
        
        guard let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context) else { return nil }
        
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = false
    }
}
