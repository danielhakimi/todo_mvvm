//
//  ToDoListTableView.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 27/08/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

class ToDoListTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: ToDoListRepresentable
    
    init(viewModel: ToDoListRepresentable) {
        
        self.viewModel = viewModel
        super.init(frame: .zero, style: .plain)
        self.separatorStyle = .none
        self.delegate = self
        self.dataSource = self
        self.rowHeight = 100
        self.register(ToDoCell.self, forCellReuseIdentifier: Cell.ToDoID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.state.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: Cell.ToDoID)
        
        guard let todoCell = cell as? ToDoCell else { fatalError("Unable to deuque Todo Cell") }
        
        todoCell.toDo = viewModel.state.todos[indexPath.row]
        
        return todoCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = viewModel.state.todos[indexPath.row]
        
        assert(viewModel.toDoSelected != nil)
        
        viewModel.toDoSelected?(todo)
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = ToDoListViewModel(state: ToDoState())
        super.init(coder: aDecoder)
    }
}
