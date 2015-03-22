//
//  AddTaskViewController.swift
//  Taskit
//
//  Created by terry atkins on 21/03/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {


    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTaskField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func addTaskButtonTapped(sender: UIButton) {
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        
        let managedObjectContext = appDelegate.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext!)
        let thisTask = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext!)
        thisTask.task = taskTextField.text
        thisTask.subtask = subtaskTaskField.text
        thisTask.date = dueDatePicker.date
        thisTask.completed = false
        
        appDelegate.saveContext()
        
        var request = NSFetchRequest(entityName: "TaskModel")
        var error:NSError? = nil
        
        var results:NSArray = managedObjectContext!.executeFetchRequest(request, error: &error)!
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
