//
//  EditToDoViewController.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 03/09/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

class EditToDoViewController: BaseCreateToDoViewController, UITextViewDelegate {
    
    var viewModel: AddToDoRepresentable?
    
    init(viewModel: AddToDoRepresentable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.isValidListener = { [unowned self] (isValid) in
            self.saveButton.enable(isValid)
        }
        
        setupView()
    }
    
    override func setupView() {
        self.title = "Edit ToDo"
        
        super.setupView()
        self.saveButton.setTitle("Save", for: .normal)
        self.saveButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        todoTitleField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        descriptionField.delegate = self
        
        todoTitleField.text = viewModel?.toDo.name
        descriptionField.text = viewModel?.toDo.decription
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        viewModel?.toDo.name = textField.text!
    }
    
    func textViewDidChange(_ textView: UITextView) {
        viewModel?.toDo.decription = textView.text
    }
    
    @objc func buttonTapped() {
        viewModel?.save()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
