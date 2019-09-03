//
//  ToDoState.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 03/09/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//
import Foundation

class ToDoState {
    var stateUpdated: (() -> (Void))?
    var todos: [ToDo] = [
        ToDo(name: "Take trash out", decription: "It stinks!", dateCreated: Date(), dueDate: nil, priority: .important),
        ToDo(name: "Walk the dog", decription: "Make sure you go for at least 30 mins", dateCreated: Date(), dueDate: nil, priority: .important),
        ToDo(name: "Go Shopping", decription: "Go to the albert heijn, they have great worstjes!", dateCreated: Date(), dueDate: nil, priority: .important),
        ] {
        didSet {
            stateUpdated?()
        }
    }
}
