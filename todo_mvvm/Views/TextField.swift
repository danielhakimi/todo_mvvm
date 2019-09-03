//
//  TextField.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 03/09/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

class TextField: UITextField {
    convenience init(placeholderText: String = "") {
        self.init(frame: .zero)
        self.borderStyle = .roundedRect
        self.placeholder = placeholderText
        self.textColor = UIColor.black.withAlphaComponent(0.7)
    }
}
