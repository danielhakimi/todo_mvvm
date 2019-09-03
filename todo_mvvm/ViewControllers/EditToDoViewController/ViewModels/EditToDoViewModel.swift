//
//  EditToDoViewModel.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 03/09/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

struct EditToDoViewModel: AddToDoRepresentable {
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
        guard let matchedToDoIndex = state.todos.firstIndex(where: { $0.id == toDo.id }) else { return }
        
        var listOfToDos = state.todos
        listOfToDos[matchedToDoIndex] = toDo
        
        state.todos = listOfToDos
        didSaveToDo?()
    }
}
