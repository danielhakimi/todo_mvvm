//
//  UIButton+Extension.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 03/09/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

extension UIButton {
    func enable(_ enable: Bool) {
        self.isEnabled = enable
        
        UIView.animate(withDuration: 0.3) {
            self.alpha = enable ? 1.0 : 0.3
        }
    }
}
