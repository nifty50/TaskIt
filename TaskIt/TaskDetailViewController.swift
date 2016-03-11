//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Ansel Adams on 2/15/16.
//  Copyright © 2016 Ansel Adams. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    var detailTaskModel: TaskModel!
    
    @IBOutlet weak var taskTextfield: UITextField!
    @IBOutlet weak var subtaskTextfield: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskTextfield.text = detailTaskModel.task
        self.subtaskTextfield.text = detailTaskModel.subtask
        self.dueDatePicker.date = detailTaskModel.date!
    }

    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneBarButtonItemPressed(sender: UIBarButtonItem) {
        let appDelegate = (UIApplication.sharedApplication().delegate) as! AppDelegate
        detailTaskModel.task = taskTextfield.text
        detailTaskModel.subtask = subtaskTextfield.text
        detailTaskModel.date = dueDatePicker.date
        detailTaskModel.completed = detailTaskModel.completed
        appDelegate.saveContext()
        self.navigationController?.popViewControllerAnimated(true)
    }
}
