//
//  MessageView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/24.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class MessageView: UIView {
    let underlineView = UIView()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var jaMessageLabel: UILabel!
    @IBOutlet weak var enMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont.alphanumericFont(30)
        titleLabel.textColor = UIColor.subColor01()
        
        enMessageLabel.font = UIFont.alphanumericFont(20)
        enMessageLabel.textColor = UIColor.subColor01()
        
//        enMessageLabel.text = "not setting alarm."
        enMessageLabel.text = "setting alarm."
        enMessageLabel.sizeToFit()
        
        underlineView.backgroundColor = UIColor.subColor01()
        underlineView.frame = CGRectMake(0, enMessageLabel.frame.height - 4, enMessageLabel.frame.width, 0.3)
        underlineView.autoresizingMask = .FlexibleRightMargin | .FlexibleBottomMargin | .FlexibleLeftMargin
        
//        jaMessageLabel.text = "アラームは設定されていません。"
        jaMessageLabel.text = "明日の08:50にアラームが設定されています。"
        jaMessageLabel.font = UIFont.font(12)
        jaMessageLabel.textColor = UIColor.subColor01()
        
        enMessageLabel.addSubview(underlineView)
    }
}
