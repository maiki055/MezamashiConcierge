//
//  ButtonWrapperView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/29.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

@objc protocol ButtonWrapperViewDelegate {
    func buttonWrapperView(buttonWrapperView: ButtonWrapperView, didSelectButton: UIButton)
}

class ButtonWrapperView: UIView {
    @IBOutlet weak var button: Button!
    
    weak var delegate: ButtonWrapperViewDelegate?

    @IBAction func didSelectButton(sender: UIButton) {
        self.delegate?.buttonWrapperView(self, didSelectButton: sender)
    }
    
}
