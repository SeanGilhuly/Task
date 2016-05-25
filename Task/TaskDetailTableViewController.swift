//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Sean Gilhuly on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    var task: Task?
    
    var dueDateValue: NSDate?
    
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       dueDateTextField.inputView = dueDatePicker
        
        if let task = task {
            updateWithTask(task)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBAction
    
    @IBAction func saveButtonPressed(sender: AnyObject) {

        
    }
    
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
        
    }

    
    @IBAction func userTappedView(sender: AnyObject) {
        self.nameTextField.resignFirstResponder()
        self.dueDateTextField.resignFirstResponder()
        self.notesTextView.resignFirstResponder()
    }
    
    
    //MARK: - Functions
    
    func updateWithTask(task: Task) {
        self.task = task
        
        title = task.name
        nameTextField.text = task.name
        
        if let due = task.due {
            dueDateTextField.text = due.stringValue()
        }
        
        if let notes = task.notes {
            notesTextView.text = notes
        }
    }
    
}