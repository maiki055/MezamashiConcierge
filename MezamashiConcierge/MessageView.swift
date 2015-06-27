//
//  MessageView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/24.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

@objc protocol MessageViewDelegate {
    optional func messageView(messageView: MessageView, didSelectAlermButton button: UIButton)
    optional func messageView(messageView: MessageView, didSelectLeaveButton button: UIButton)
}

class MessageView: UIView, UITableViewDelegate {
    let messageViewModel = MessageViewModel()
    let underlineView = UIView()
    weak var delegate: MessageViewDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var jaMessageLabel: UILabel!
    @IBOutlet weak var enMessageLabel: UILabel!
    @IBOutlet weak var leftButton: Button!
    @IBOutlet weak var rightButton: Button!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont.alphanumericFont(30)
        titleLabel.textColor = UIColor.subColor01()
        
        enMessageLabel.font = UIFont.alphanumericFont(20)
        enMessageLabel.textColor = UIColor.subColor01()
        
        enMessageLabel.text = messageViewModel.enMessage
        enMessageLabel.sizeToFit()
        
        underlineView.backgroundColor = UIColor.subColor01()
        underlineView.frame = CGRectMake(0, enMessageLabel.frame.height - 4, enMessageLabel.frame.width, 0.3)
        underlineView.autoresizingMask = .FlexibleRightMargin | .FlexibleBottomMargin | .FlexibleLeftMargin
        
        jaMessageLabel.text = messageViewModel.jaMessage
        jaMessageLabel.font = UIFont.font(12)
        jaMessageLabel.textColor = UIColor.subColor01()
        
        enMessageLabel.addSubview(underlineView)
        
        leftButton.addTarget(self, action: "didSelectAlermButton:", forControlEvents: .TouchUpInside)
        rightButton.addTarget(self, action: "didSelectLeaveButton:", forControlEvents: .TouchUpInside)
    }
    
    // MARK: TouchEvent
    
    func didSelectAlermButton(sender: UIButton) {
        self.delegate?.messageView?(self, didSelectAlermButton: sender)
    }
    
    func didSelectLeaveButton(sender: UIButton) {
        self.delegate?.messageView?(self, didSelectLeaveButton: sender)
    }
}
