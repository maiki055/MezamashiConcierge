//
//  AlarmView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class AlarmView: UIView {
    let alarm = Alarm()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.subColor01()
        label.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        label.font = UIFont.alphanumericFont(18)
        label.textAlignment = NSTextAlignment.Center
        self.addSubview(label)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawRect(rect: CGRect) {
        label.text = "8:50"
    }

}
