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
    optional func messageView(messageView: MessageView, didSelectCancelButton button: UIButton)
}

class MessageView: UIView, UITableViewDelegate {
    var messageViewModel: MessageStatus! {
        didSet {
            enMessageLabel.text = messageViewModel.enMessage()
            jaMessageLabel.text = messageViewModel.jaMessage()
            if messageViewModel.buttons().count == 1 {
                buttonsWrapperView.hidden = true
                buttonWrapperView.hidden = false
                buttonWrapperView.button.setTitle(messageViewModel.buttons()[0], forState: .Normal)
            }
            else {
                buttonsWrapperView.hidden = false
                buttonWrapperView.hidden = true
                buttonsWrapperView.leftButton.setTitle(messageViewModel.buttons()[0], forState: .Normal)
                buttonsWrapperView.rightButton.setTitle(messageViewModel.buttons()[1], forState: .Normal)
            }
        }
    }
    let underlineView = UIView()
    weak var delegate: MessageViewDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var jaMessageLabel: UILabel!
    @IBOutlet weak var enMessageLabel: UILabel!
    var buttonsWrapperView: ButtonsWrapperView!
    var buttonWrapperView: ButtonWrapperView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont.alphanumericFont(30)
        titleLabel.textColor = UIColor.subColor01()
        
        enMessageLabel.font = UIFont.alphanumericFont(20)
        enMessageLabel.textColor = UIColor.subColor01()
        
        enMessageLabel.sizeToFit()
        
        underlineView.backgroundColor = UIColor.subColor01()
        underlineView.frame = CGRectMake(0, enMessageLabel.frame.height - 4, enMessageLabel.frame.width, 0.3)
        underlineView.autoresizingMask = .FlexibleRightMargin | .FlexibleBottomMargin | .FlexibleLeftMargin
        
        jaMessageLabel.font = UIFont.font(12)
        jaMessageLabel.textColor = UIColor.subColor01()
        
        buttonsWrapperView = UINib(nibName: "ButtonsWrapperView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! ButtonsWrapperView
        let relativeY = viewMaxY(jaMessageLabel) + viewMinY(jaMessageLabel)
        buttonsWrapperView.frame = CGRectMake(0, relativeY, viewWidth(self), viewHeight(self) - relativeY)
        buttonsWrapperView.autoresizingMask = .FlexibleTopMargin | .FlexibleRightMargin | .FlexibleBottomMargin | .FlexibleLeftMargin
        buttonWrapperView = UINib(nibName: "ButtonWrapperView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! ButtonWrapperView
        buttonWrapperView.frame = buttonsWrapperView.frame
        buttonWrapperView.autoresizingMask = .FlexibleTopMargin | .FlexibleRightMargin | .FlexibleBottomMargin | .FlexibleLeftMargin
        
        buttonsWrapperView.leftButton.addTarget(self, action: "didSelectAlermButton:", forControlEvents: .TouchUpInside)
        buttonsWrapperView.rightButton.addTarget(self, action: "didSelectLeaveButton:", forControlEvents: .TouchUpInside)
        buttonWrapperView.button.addTarget(self, action: "didSelectCancelButton:", forControlEvents: .TouchUpInside)
        
        enMessageLabel.addSubview(underlineView)
        self.addSubview(buttonsWrapperView)
        self.addSubview(buttonWrapperView)
    }
    
    // MARK: TouchEvent
    func didSelectAlermButton(sender: UIButton) {
        self.delegate?.messageView?(self, didSelectAlermButton: sender)
    }
    
    func didSelectLeaveButton(sender: UIButton) {
        self.delegate?.messageView?(self, didSelectLeaveButton: sender)
    }
    
    func didSelectCancelButton(sender: UIButton) {
        self.delegate?.messageView?(self, didSelectCancelButton: sender)
    }
}
