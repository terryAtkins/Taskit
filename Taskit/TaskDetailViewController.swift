//
//  TaskDetailViewController.swift
//  Taskit
//
//  Created by terry atkins on 20/03/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    var detailTaskModel: TaskModel!
  
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(detailTaskModel.task)

        // Do any additional setup after loading the view.
        
        taskTextField.text = detailTaskModel.task
        subtaskTextField.text = detailTaskModel.subtask
        dueDatePicker.date = detailTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func doneBarButtonItemPresed(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        
        detailTaskModel.task = taskTextField.text
        detailTaskModel.subtask = subtaskTextField.text
        detailTaskModel.date = dueDatePicker.date
        detailTaskModel.completed = detailTaskModel.completed
        
        appDelegate.saveContext()
    }
    
    
}
