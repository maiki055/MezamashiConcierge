//
//  ButtonGroupView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/29.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class ButtonGroupView: UIView {
    var buttonCount = 1
    
    func createButton() -> Button {
        let button = Button()
        button.frame.size = CGSize(width: 115, height: 30)
        return button
    }
}
