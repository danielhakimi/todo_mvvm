//
//  ToDo.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 26/08/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import Foundation

enum Priority {
    case neutral
    case important
    case veryImportant
}

struct ToDo {
    let id: UUID = UUID.init()
    var name: String
    var decription: String
    let dateCreated: Date
    var dueDate: Date?
    var priority: Priority
    var done: Bool = false
    
    init(name: String = "", decription: String = "", dateCreated: Date = Date(), dueDate: Date? = nil, priority: Priority = .neutral) {
        self.name = name
        self.decription = decription
        self.dateCreated = dateCreated
        self.dueDate = dueDate
        self.priority = priority
    }
}
