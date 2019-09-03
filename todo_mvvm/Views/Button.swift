//
//  Button.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 03/09/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

class Button: UIButton {
    convenience init(title: String) {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.backgroundColor = UIColor.blue.withAlphaComponent(0.7)
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.constrainHeight(40)
        self.constrainWidth(140)
    }
}

