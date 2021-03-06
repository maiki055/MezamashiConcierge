//
//  SwitchButton.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/11.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

@objc protocol SwitchButtonDelegate {
    optional func switchButton(switchButton: SwitchButton, shouldSelectButton button: UIButton) -> Bool
}

class SwitchButton: UIView {
    let activeColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
    let inActiveColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
    dynamic var selected = false {
        didSet {
            activeLamp.hidden = !selected
            if selected {
                textLabel.textColor = activeColor
            }
            else {
                textLabel.textColor = inActiveColor
            }
        }
    }
    let button = UIButton()
    let textLabel = UILabel()
    let activeLamp = UIView()
    weak var delegate: SwitchButtonDelegate?
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
    }
 
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareView() {
        button.frame = CGRect(x: 0, y: 0, width: viewHeight(self), height: viewHeight(self))
        button.addTarget(self, action: "didSelectButton:", forControlEvents: .TouchDown)
        button.layer.cornerRadius = 3
        button.layer.borderColor = inActiveColor.CGColor
        button.layer.borderWidth = 1
        
        let lampSize = viewHeight(button) * 0.5
        activeLamp.frame = CGRect(x: (viewWidth(button) - lampSize) / 2, y: (viewHeight(button) - lampSize) / 2, width: lampSize, height: lampSize)
        activeLamp.backgroundColor = activeColor
        activeLamp.layer.cornerRadius = 2

        textLabel.frame = CGRectMake(viewMaxX(button) + 5, 0, viewWidth(self) - viewMaxX(button) - 5, viewHeight(self))
        textLabel.font = UIFont.font(11)
        
        self.addSubview(activeLamp)
        self.addSubview(button)
        self.addSubview(textLabel)
        self.selected = false
    }
    
    func didSelectButton(sender: UIButton) {
        if (delegate?.switchButton?(self, shouldSelectButton: sender) != nil && delegate?.switchButton?(self, shouldSelectButton: sender) == true) {
            selected = !selected
        }
    }
}
