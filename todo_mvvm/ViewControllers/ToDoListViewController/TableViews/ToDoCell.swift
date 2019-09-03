//
//  ToDoCell.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 27/08/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    var nameLabel = Label()
    var descriptionLabel = Label(numberOfLines: 2, fontSize: 14, lineBreakMode: .byTruncatingTail)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: Cell.ToDoID)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    var toDo: ToDo? {
        didSet {
            updateView()
        }
    }
    
    func setupView() {
        let vStack = VStack(views: [nameLabel, descriptionLabel])
        contentView.addSubview(vStack)
        
        vStack.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            bottom: nil,
            trailing: contentView.trailingAnchor,
            padding: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        )
        
        let line = UIView(frame: .zero)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = Colors.blackWithAlpha.withAlphaComponent(0.1)
        contentView.addSubview(line)
        
        line.anchor(
            top: nil,
            leading: contentView.leadingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: contentView.trailingAnchor,
            padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        )
        
        line.topAnchor.constraint(greaterThanOrEqualTo: vStack.bottomAnchor)
        
        line.constrainHeight(0.5)
    }
    
    func updateView() {
        
        assert(toDo != nil)
        
        nameLabel.text = toDo?.name
        descriptionLabel.text = toDo?.decription
    }
}
