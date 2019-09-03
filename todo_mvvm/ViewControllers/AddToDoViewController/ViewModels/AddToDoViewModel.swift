//
//  AddToDoViewModel.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 03/09/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

struct AddToDoViewModel: AddToDoRepresentable {
    let state: ToDoState
    var toDo: ToDo {
        didSet {
            emitValdility()
        }
    }
    var didSaveToDo: (() -> Void)?
    var isValidListener: ((Bool) -> ())?
    
    init(toDo: ToDo, state: ToDoState) {
        self.toDo = toDo
        self.state = state
    }
    
    func save() {
        state.todos.append(self.toDo)
        didSaveToDo?()
    }
}

