//
//  ToDoListViewModel.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 03/09/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import Foundation

class ToDoListViewModel: ToDoListRepresentable {
    var state: ToDoState
    var numberOfSections: Int = 1
    
    var addToDoButtonTapped: (() -> Void)?
    var toDoSelected: ((ToDo) -> Void)?
    var todosUpdated: (() -> Void)?
    
    init(state: ToDoState) {
        self.state = state
        
        self.state.stateUpdated = { [weak self] in
            self?.todosUpdated?()
        }
    }
}
