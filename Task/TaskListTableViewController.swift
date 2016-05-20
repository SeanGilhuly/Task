//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Sean Gilhuly on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController, ButtonTableViewCell {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.sharedController.tasks.count

    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath)

        // Configure the cell...

        let task = TaskController.sharedController.tasks[indexPath.row]
        cell.updateWithTask(task)
        return cell
    }


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let deletedTask = TaskController.sharedController.tasks[indexPath.row]
            TaskController.sharedController.removeTask(deletedTask)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toAddTask" {
            if let taskDetailViewController = segue.destinationViewController as? TaskDetailTableViewController {
                if let taskCell = sender as? UITableViewCell {
                    if let indexPath = tableView.indexPathForCell(taskCell) {
                        taskDetailViewController.task = TaskController.sharedController.tasks[indexPath.row]
                    }
                }
            }
        }
    }
}
