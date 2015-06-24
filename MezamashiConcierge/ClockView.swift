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
        dateFormatter.dateFormat = "HH:mm"
        
        clockLabel.frame.size = CGSize(width: frame.width, height: frame.height)
        clockLabel.center = center
        clockLabel.font = UIFont.alphanumericFont(60)
        clockLabel.textColor = UIColor.subColor01()
        clockLabel.textAlignment = NSTextAlignment.Center
        self.addSubview(clockLabel)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawRect(rect: CGRect) {
        clockLabel.text = dateFormatter.stringFromDate(date)
        
        let radius = self.frame.height * (1/4)
        let clockwise = true
        let startAngle = 3 * M_PI / 2
        let endAngle = 3 * M_PI / 2 + 2 * M_PI
        
        let path = UIBezierPath(arcCenter: center, radius: radius,  startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: clockwise)
        path.lineWidth = 10
        UIColor.color(decRed: 73, decGreen: 184, decBlue: 232, alpha: 1).setStroke()
        
        path.stroke()
    }

}
