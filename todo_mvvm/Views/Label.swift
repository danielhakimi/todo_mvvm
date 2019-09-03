//
//  Label.swift
//  todo_mvvm
//
//  Created by Daniel Hakimi on 27/08/2019.
//  Copyright © 2019 Daniel Hakimi. All rights reserved.
//

import UIKit

class Label: UILabel {
    init(frame: CGRect = .zero,
         numberOfLines: Int = 0,
         fontSize: CGFloat = 17,
         textColor: UIColor = Colors.blackWithAlpha, lineBreakMode: NSLineBreakMode = .byWordWrapping) {
        super.init(frame: frame)
        
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textColor = textColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
