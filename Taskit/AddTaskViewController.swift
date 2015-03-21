//
//  AddTaskViewController.swift
//  Taskit
//
//  Created by terry atkins on 21/03/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    var mainVC: ViewController!
    
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
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func addTaskButtonTapped(sender: UIButton) {
        var task = TaskModel(task: taskTextField.text, subtask: subtaskTaskField.text, date: dueDatePicker.date, completed: false)
        mainVC.baseArray[0].append(task)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
