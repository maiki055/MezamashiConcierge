//
//  ClockView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class ClockView: UIView {
    let clockViewModel = ClockViewModel()
    let dateFormatter = NSDateFormatter()
    let clockLabel = UILabel()
    // for draw
    let startAngle = 3 * M_PI / 2
    let hourLineWidth: CGFloat = 10
    let minuteLineWidth: CGFloat = 5
    let secoundLineWidth: CGFloat = 2
    let color = UIColor.color(decRed: 73, decGreen: 184, decBlue: 232, alpha: 1)
    let baseColor = UIColor.color(decRed: 73, decGreen: 184, decBlue: 232, alpha: 0.5)
    
    var date: NSDate = NSDate() {
        didSet {
            clockViewModel.date = date
            clockLabel.text = dateFormatter.stringFromDate(date)
        }
    }
    
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
        let hourRedius = self.frame.height * (3/10)
        let roundAngle = startAngle + 2 * M_PI

        drawCircle(redius: hourRedius, endAngle: roundAngle, lineWidth: hourLineWidth, lineColor: baseColor)
        drawCircle(redius: hourRedius, endAngle: startAngle + Double(clockViewModel.shorthand()) * 2 * M_PI, lineWidth: hourLineWidth, lineColor: color)
        
        let minRadius = hourRedius - (hourLineWidth + 2)
        drawCircle(redius: minRadius, endAngle: roundAngle, lineWidth: minuteLineWidth, lineColor: baseColor)
        drawCircle(redius: minRadius, endAngle: startAngle + Double(clockViewModel.longhand()) * 2 * M_PI, lineWidth: minuteLineWidth, lineColor: color)
        
        let secRadius = minRadius - (minuteLineWidth + 4)
        drawCircle(redius: secRadius, endAngle: roundAngle, lineWidth: secoundLineWidth, lineColor: baseColor)
        drawCircle(redius: secRadius, endAngle: startAngle + Double(clockViewModel.secondhand()) * 2 * M_PI, lineWidth: secoundLineWidth, lineColor: color)
    }
    
    func drawCircle(redius radius: CGFloat, endAngle: Double, lineWidth: CGFloat, lineColor: UIColor) {
        let path = UIBezierPath(arcCenter: center, radius: radius,  startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        path.lineWidth = lineWidth
        lineColor.setStroke()
        path.stroke()
    }

}
