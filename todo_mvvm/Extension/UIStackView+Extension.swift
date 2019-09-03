//
//  UIStackView+Extension.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 26/08/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(views: [UIView]) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
