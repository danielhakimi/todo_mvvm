//
//  ViewController.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 26/08/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    var viewModel: ToDoListRepresentable
    
    init(viewModel: ToDoListRepresentable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.todosUpdated = { [weak self] in
            self?.updateView()
        }
        
        setupView()
    }
    
    func updateView() {
        tableView?.reloadData()
    }
    
    var tableView: ToDoListTableView!
    
    func setupView() {
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationController?.navigationBar.isTranslucent = false
        
        self.title = "ToDo List"

        tableView = ToDoListTableView(viewModel: self.viewModel)
        view.addSubview(tableView)
        
        tableView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addTapped() {
        self.viewModel.addToDoButtonTapped?()
    }
}
