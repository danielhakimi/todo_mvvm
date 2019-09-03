//
//  AppCoordinator.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 26/08/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//


import UIKit

protocol Coordinator: AnyObject {
    func start()
    var didFinish: ((Coordinator) -> Void)? { get set }
}

class AppCoordinator: Coordinator {
    private let navigationController = UINavigationController()
    
    private var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    let toDoState: ToDoState = ToDoState()
    
    func start() {
        showToDos()
    }
    
    var didFinish: ((Coordinator) -> Void)?
    
    func showToDos() {
        let todosVc = ToDoListViewController(viewModel: ToDoListViewModel(state: toDoState))
        
        todosVc.viewModel.addToDoButtonTapped = { [weak self] in
            self?.showToDo(toDo: ToDo())
        }
        
        todosVc.viewModel.toDoSelected = { [weak self] (toDo) in
            self?.editToDo(toDo: toDo)
        }
        
        navigationController.pushViewController(todosVc, animated: true)
    }
    
    func showToDo(toDo: ToDo) {
        
        let addToDoCoordinator = AddToDoCoordinator(navigationController: navigationController, toDo: toDo, state: toDoState)
        
        pushCoordinator(addToDoCoordinator)
    }
    
    func editToDo(toDo: ToDo) {
        
        let editToDoCoordinator = EditToDoCoordinator(navigationController: navigationController, toDo: toDo, state: toDoState)
        
        pushCoordinator(editToDoCoordinator)
    }
    
    private func pushCoordinator(_ coordinator: Coordinator) {
        
        coordinator.didFinish = { [weak self] (c) in
            
            if let firstIndex = self?.childCoordinators.firstIndex (where: { $0 === c }) {
                self?.childCoordinators.remove(at: firstIndex)
            }
        }
        
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}

