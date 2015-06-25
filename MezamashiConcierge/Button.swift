//
//  Button.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/25.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class Button: UIButton {
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
        self.titleLabel?.font = UIFont.font(12)
        self.setTitleColor(UIColor.subColor02(), forState: .Normal)
        self.layer.cornerRadius = 2
        self.layer.borderColor = UIColor.subColor02().CGColor
        self.layer.borderWidth = 0.5
    }
}
