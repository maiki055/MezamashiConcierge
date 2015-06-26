//
//  CallConciergeView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/26.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

@objc protocol CallConciergeViewDelegate {
    func callConciergeView()
}

class CallConciergeView: UIView {
    static let size = CGSize(width: 80, height: 80)
    static let iconSize = CGSize(width: 45, height: 45)
    static let messageHeight: CGFloat = 20
    
    convenience init() {
        let origin = CGPoint(x: Devise.screenWidth - CallConciergeView.size.width + 15, y: Devise.screenHeight - CallConciergeView.size.height + 10)
        self.init(frame: CGRect(origin: origin, size: CallConciergeView.size))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.color(decRed: 208, decGreen: 176, decBlue: 134, alpha: 0.7)
        self.layer.borderColor = UIColor.color(decRed: 180, decGreen: 180, decBlue: 180, alpha: 1).CGColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = frame.width / 2
        
        let iconView = UIImageView(image: UIImage(named: "handbell"))
        iconView.image = iconView.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        iconView.tintColor = UIColor.subColor01()
        iconView.alpha = 0.8
        iconView.frame.size = CallConciergeView.iconSize
        iconView.frame.origin = CGPoint(x: (self.frame.width - iconView.frame.width) / 2, y: (frame.height - iconView.frame.height - CallConciergeView.messageHeight) / 2)
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: iconView.frame.maxY, width: frame.width, height: CallConciergeView.messageHeight))
        messageLabel.text = "Concerge"
        messageLabel.font = UIFont.alphanumericFont(15)
        messageLabel.textAlignment = .Center
        messageLabel.textColor = UIColor.subColor01()
        
        self.addSubview(iconView)
        self.addSubview(messageLabel)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: TouchEvent
    
    func didSelectCallConciergeButton(sender: UIButton) {
        
    }
}
