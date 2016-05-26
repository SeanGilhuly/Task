//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Sean Gilhuly on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    // MARK - IBOutlets and Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    var task: Task?
    
    var dueDateValue: NSDate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dueDateTextField.inputView = dueDatePicker
        
        if let task = task {
            updateWithTask(task)
        }

    }

    // MARK: - IBActions
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func datePickerValueChanged(sender: AnyObject) {
        self.dueDateTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }

    @IBAction func userTappedView(sender: AnyObject) {
        self.nameTextField.resignFirstResponder()
        self.dueDateTextField.resignFirstResponder()
        self.notesTextField.resignFirstResponder()
    }

    func updateTask() {
        
        guard let name = nameTextField.text else {return}
        let due = dueDateValue
        let notes = notesTextField.text
        
        if let task = self.task {
            TaskController.sharedController.updateTask(task, name: name, notes: notes, due: due)
        } else {
            TaskController.sharedController.addTask(name, notes: notes, due: due)
        }
    }
    
    func updateWithTask(task: Task) {
        self.task = task
        
        title = task.name
        nameTextField.text = task.name
        
        if let due = task.due {
            dueDateTextField.text = due.stringValue()
        }
        
        if let notes = task.notes {
            notesTextField.text = notes
        }
        
    }
}