//
//  MessageView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/24.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class MessageView: UIView {
    let messageLabel = UILabel()
    let underlineView = UIView()
    let subMessageLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 60))
        titleLabel.text = "Concierge"
        titleLabel.font = UIFont.alphanumericFont(30)
        titleLabel.textColor = UIColor.subColor01()
        titleLabel.textAlignment = NSTextAlignment.Center
        
        messageLabel.font = UIFont.alphanumericFont(20)
        messageLabel.textColor = UIColor.subColor01()
        
        messageLabel.text = "not setting alarm."
        messageLabel.sizeToFit()
        messageLabel.frame.origin = CGPoint(x: (self.frame.width - messageLabel.frame.width) / 2, y: titleLabel.frame.maxY)
        
        underlineView.backgroundColor = UIColor.subColor01()
        underlineView.frame = CGRectMake(0, messageLabel.frame.height - 4, messageLabel.frame.width, 0.3)
        underlineView.autoresizingMask = .FlexibleRightMargin | .FlexibleBottomMargin | .FlexibleLeftMargin

        subMessageLabel.frame = CGRect(x: 0, y: messageLabel.frame.maxY + 8, width: self.frame.width, height:20)
        subMessageLabel.text = "アラームは設定されていません。"
        subMessageLabel.font = UIFont.font(12)
        subMessageLabel.textColor = UIColor.subColor01()
        subMessageLabel.textAlignment = NSTextAlignment.Center
        
        self.addSubview(titleLabel)
        self.addSubview(messageLabel)
        messageLabel.addSubview(underlineView)
        self.addSubview(subMessageLabel)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
