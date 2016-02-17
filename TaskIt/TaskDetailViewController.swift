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
        self.subtaskTextfield.text = detailTaskModel.subTask
        self.dueDatePicker.date = detailTaskModel.date
    }

}
