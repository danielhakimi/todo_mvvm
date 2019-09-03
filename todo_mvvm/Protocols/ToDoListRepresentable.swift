//
//  ToDoListRepresentable.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 03/09/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

protocol ToDoListRepresentable {
    var state: ToDoState { get }
    var numberOfSections: Int { get }
    var addToDoButtonTapped: (() -> Void)? { get set }
    var toDoSelected: ((ToDo) -> Void)? { get set }
    var todosUpdated: (() -> Void)? { get set }
}
