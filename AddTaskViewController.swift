//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Ansel Adams on 2/16/16.
//  Copyright © 2016 Ansel Adams. All rights reserved.
//

import UIKit
import CoreData

protocol AddTaskViewControllerDelegate {
    func addTask(message: String)
    func addTaskCanceled(message: String)
}

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var delegate: AddTaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func cancelButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
        delegate?.addTaskCanceled("Task was not added")
    }
    
    @IBAction func addTaskButtonTapped(sender: AnyObject) {
        let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let managedObjectContext = appDelegate.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext!)
        let task = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        if NSUserDefaults.standardUserDefaults().boolForKey(kShouldCapitalizeTaskKey) == true {
            task.task = taskTextField.text?.capitalizedString
        } else {
            task.task = taskTextField.text
        }
        
        task.subtask = subtaskTextField.text
        task.date = dueDatePicker.date
        
        if NSUserDefaults.standardUserDefaults().boolForKey(kShouldCompleteNewTodoKey) == true {
            task.completed = true
        } else {
            task.completed = false
        }
        
        appDelegate.saveContext()
        
        let request = NSFetchRequest(entityName: "TaskModel")
        var results: NSArray? = nil
        do {
            try results = managedObjectContext!.executeFetchRequest(request)
            for res in results! {
                print(res)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
            abort()
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        delegate?.addTask("task added")
    }
}
