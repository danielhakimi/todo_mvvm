//
//  BaseCreateToDoViewController.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 03/09/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

class BaseCreateToDoViewController: UIViewController {
    
    let todoTitleField = TextField(placeholderText: "Write your toDo here...")
    let saveButton = Button(title: "")
    let descriptionField = TextView()
    func setupView() {
        
        view.backgroundColor = .white
        edgesForExtendedLayout = []
        
        let containerView = UIView(frame: .zero)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        containerView.centerInSuperview(paddingY: -150)
        containerView.anchor(
            top: nil,
            leading: view.leadingAnchor,
            bottom: nil,
            trailing: view.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        )
        
        containerView.addSubview(todoTitleField)
        
        todoTitleField.anchor(
            top: containerView.topAnchor,
            leading: containerView.leadingAnchor,
            bottom: nil,
            trailing: containerView.trailingAnchor,
            padding: UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16)
        )
        
        containerView.addSubview(descriptionField)
        
        descriptionField.anchor(
            top: todoTitleField.bottomAnchor,
            leading: containerView.leadingAnchor,
            bottom: nil,
            trailing: containerView.trailingAnchor,
            padding: UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16)
        )
        
        descriptionField.constrainHeight(100)
        
        containerView.addSubview(saveButton)
        saveButton.centerXTo(containerView.centerXAnchor)
        saveButton.anchor(
            top: descriptionField.bottomAnchor,
            leading: nil,
            bottom: containerView.bottomAnchor,
            trailing: nil,
            padding: UIEdgeInsets(top: 32, left: 16, bottom: 0, right: 16)
        )
    }
}
