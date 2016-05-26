//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Sean Gilhuly on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate {


    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

 

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.sharedController.tasks.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as? ButtonTableViewCell ?? ButtonTableViewCell()
        let task = TaskController.sharedController.tasks[indexPath.row]
        cell.updateWithTask(task)
        cell.delegate = self
        return cell
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            // Delete the row from the data source
            let row = TaskController.sharedController.tasks[indexPath.row]
            TaskController.sharedController.removeTask(row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // MARK: - ButtonTableViewCellDelegate
    
    func buttonCellButtonTapped(sender: ButtonTableViewCell) {
        guard let indexPath = tableView.indexPathForCell(sender),
            task = TaskController.sharedController.tasks[indexPath.row] else {return}
        TaskController.sharedController.isCompleteValueToggle(task)
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toViewTask" {
            if let taskDetailViewController = segue.destinationViewController as? TaskDetailTableViewController {
                if let taskCell = sender as? UITableViewCell {
                    if let indexPath = tableView.indexPathForCell(taskCell) {
                let task = TaskController.sharedController.tasks[indexPath.row]
                taskDetailViewController.task = task
                    }
                }
            }
        }
    }
}







