//
//  AddToDoRepresentable.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 03/09/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

protocol AddToDoRepresentable {
    var state: ToDoState { get }
    var toDo: ToDo { get set }
    var didSaveToDo: (() -> Void)? { get set }
    var isValidListener: ((Bool) -> ())? { get set }
    
    func save()
}

extension AddToDoRepresentable {
    func emitValdility() {
        let isValid = !toDo.name.isEmpty
        isValidListener?(isValid)
    }
}
