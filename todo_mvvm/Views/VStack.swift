//
//  VStack.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 27/08/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

class VStack: UIStackView {
    init(views: [UIView]) {
        
        super.init(frame: .zero)
        self.spacing = 8
        self.axis = .vertical
        self.addArrangedSubviews(views: views)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

