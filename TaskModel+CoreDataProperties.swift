//
//  TaskModel+CoreDataProperties.swift
//  TaskIt
//
//  Created by Ansel Adams on 2/21/16.
//  Copyright © 2016 Ansel Adams. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension TaskModel {

    @NSManaged var completed: NSNumber?
    @NSManaged var date: NSDate?
    @NSManaged var subtask: String?
    @NSManaged var task: String?

}
