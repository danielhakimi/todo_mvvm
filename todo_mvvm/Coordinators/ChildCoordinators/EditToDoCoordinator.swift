//
//  EditToDoCoordinator.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 03/09/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

class EditToDoCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let toDo: ToDo
    private let state: ToDoState
    
    var didFinish: ((Coordinator) -> Void)?
    
    init(navigationController: UINavigationController, toDo: ToDo, state: ToDoState) {
        self.navigationController = navigationController
        self.toDo = toDo
        self.state = state
    }
    
    func start() {
        let vc = EditToDoViewController(viewModel: EditToDoViewModel(toDo: toDo, state: state))
        
        vc.viewModel?.didSaveToDo = { [weak self] in
            self?.finish()
        }
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func finish() {
        didFinish?(self)
        
        navigationController.popViewController(animated: true)
    }
}

