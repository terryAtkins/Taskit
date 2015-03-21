//
//  ViewController.swift
//  Taskit
//
//  Created by terry atkins on 20/03/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var baseArray: [[TaskModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2015, month: 03, day: 20)
        let date2 = Date.from(year: 2015, month: 03, day: 20)
        let date3 = Date.from(year: 2015, month: 03, day: 20)
        
        let task1 = TaskModel(task: "Study french", subtask: "Verbs in past and present", date: date1, completed: false)
        let task2 = TaskModel(task: "Eat", subtask: "Piza", date: date2, completed: false)
        let task3 = TaskModel(task: "Gym", subtask: "Run", date: date3, completed: false)
        
        let taskArray = [task1, task2, task3]
        var completedArray = [TaskModel(task: "Code", subtask: "Task Project", date: date2, completed: true)]
        
        baseArray = [taskArray, completedArray]
        
        //        tableView.reloadData()  or we can add it here,
        //        but viewDidLoad only gets called when first created
        
    }
    
    //    update our view each time we come back
    //    (but apple is tacking taskArray.count so updates by it self)
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
        
        //    sort by date
        
//        func sortByDate(taskOne:TaskModel, taskTwo:TaskModel) -> Bool {
//            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//        }
//        taskArray = taskArray.sorted(sortByDate)
        
        
//        same code as above but in a closure
        baseArray[0] = baseArray[0].sorted{ (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
            // comparison logic
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
            
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
            
            
        } else if segue.identifier == "showTaskAdd" {
            let addTaskVC: AddTaskViewController = segue.destinationViewController as AddTaskViewController
            
            addTaskVC.mainVC = self
        }
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    
    //    UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseArray[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: TaskCellTableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCellTableViewCell
        
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }
    
    //    UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        performSegueWithIdentifier("showTaskDetail", sender: self)
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if  section == 0 {
            return "To Do"
        } else {
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        if indexPath.section == 0 {
            var newTask = TaskModel(task: thisTask.task, subtask: thisTask.subtask, date: thisTask.date, completed: true)
            baseArray[1].append(newTask)
        } else {
            var newTask = TaskModel(task: thisTask.task, subtask: thisTask.subtask, date: thisTask.date, completed: false)
            baseArray[0].append(newTask)
        }
        
      baseArray[indexPath.section].removeAtIndex(indexPath.row)
        
        tableView.reloadData()
    }
    
    
}














