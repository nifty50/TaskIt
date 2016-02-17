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
    var mainVC: ViewController!
    
    @IBOutlet weak var taskTextfield: UITextField!
    @IBOutlet weak var subtaskTextfield: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskTextfield.text = detailTaskModel.task
        self.subtaskTextfield.text = detailTaskModel.subTask
        self.dueDatePicker.date = detailTaskModel.date
    }

    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneBarButtonItemPressed(sender: UIBarButtonItem) {
        let task = TaskModel(task: taskTextfield.text!, subTask: subtaskTextfield.text!, date: dueDatePicker.date, completed: false)
        mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow!.row] = task
        self.navigationController?.popViewControllerAnimated(true)
    }
}
