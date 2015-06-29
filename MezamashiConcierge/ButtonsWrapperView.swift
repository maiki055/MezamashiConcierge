//
//  ButtonsWrapperView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/29.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

@objc protocol ButtonsWrapperViewDelegate {
    func buttonsWrapperView(buttonsWrapperView: ButtonsWrapperView, didSelectRightButton: UIButton)
    func buttonsWrapperView(buttonsWrapperView: ButtonsWrapperView, didSelectLeftButton: UIButton)
}

class ButtonsWrapperView: UIView {
    @IBOutlet weak var rightButton: Button!
    @IBOutlet weak var leftButton: Button!
    
    weak var delegate: ButtonsWrapperViewDelegate?
    
    @IBAction func didSelectLeftButton(sender: UIButton) {
        self.delegate?.buttonsWrapperView(self, didSelectLeftButton: sender)
    }
    
    @IBAction func didSelectRightButton(sender: UIButton) {
        self.delegate?.buttonsWrapperView(self, didSelectRightButton: sender)
    }
}
