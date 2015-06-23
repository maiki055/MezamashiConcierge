//
//  ClockView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class ClockView: UIView {
    var date: NSDate = NSDate()
    let dateFormatter = NSDateFormatter()
    let clockLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clearColor()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        dateFormatter.dateFormat = "HH:mm:ss"
        
        clockLabel.frame.size = CGSize(width: frame.width, height: frame.height)
        clockLabel.center = center
        clockLabel.font = UIFont.alphanumericFont(40)
        clockLabel.textColor = UIColor.subColor02()
        clockLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(clockLabel)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawRect(rect: CGRect) {
        clockLabel.text = dateFormatter.stringFromDate(date)
    }

}
