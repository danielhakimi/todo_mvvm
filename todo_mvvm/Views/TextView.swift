//
//  TextView.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 03/09/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

class TextView: UITextView {
    convenience init() {
        self.init(frame: .zero)
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        self.layer.borderWidth = 1
        self.font = UIFont.systemFont(ofSize: 15)
        self.textColor = Colors.blackWithAlpha
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
