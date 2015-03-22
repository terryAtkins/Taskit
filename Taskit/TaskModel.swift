//
//  TaskModel.swift
//  Taskit
//
//  Created by terry atkins on 22/03/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var task: String
    @NSManaged var subtask: String
    @NSManaged var date: NSDate

}
