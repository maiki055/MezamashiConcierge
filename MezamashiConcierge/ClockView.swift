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
    let dateFormatterHour = NSDateFormatter()
    let dateFormatterEra  = NSDateFormatter()
    let timeLabel = UILabel()
    let dayLabel  = UILabel()
    // for draw
    let startAngle = 3 * M_PI / 2
    let hourLineWidth: CGFloat    = 10
    let minuteLineWidth: CGFloat  = 5
    let secoundLineWidth: CGFloat = 2
    let color     = UIColor.color(decRed: 73, decGreen: 184, decBlue: 232, alpha: 1)
    let baseColor = UIColor.color(decRed: 73, decGreen: 184, decBlue: 232, alpha: 0.5)
    
    var date: NSDate = NSDate() {
        didSet {
            clockViewModel.date = date
            timeLabel.text = dateFormatterHour.stringFromDate(date)
            dayLabel.text = dateFormatterEra.stringFromDate(date)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clearColor()
        dateFormatterHour.locale = NSLocale(localeIdentifier: "en_US")
        dateFormatterHour.dateFormat = "HH:mm"
        dateFormatterEra.locale = NSLocale(localeIdentifier: "en_US")
        dateFormatterEra.dateFormat = "yyyy/mm/dd"
        
        timeLabel.text = "00:00"
        timeLabel.font = UIFont.alphanumericFont(55)
        timeLabel.textColor = UIColor.subColor01()
        timeLabel.sizeToFit()
        timeLabel.center = center
        
        let lineView = UIView(frame: CGRect(x: timeLabel.frame.minX, y: timeLabel.frame.maxY - 20, width: timeLabel.frame.width, height: 1))
        lineView.backgroundColor = UIColor.subColor01()
        
        dayLabel.text = "0000/00/00"
        dayLabel.font = UIFont.alphanumericFont(20)
        dayLabel.textColor = UIColor.subColor01()
        dayLabel.sizeToFit()
        dayLabel.center = CGPoint(x: center.x, y: lineView.frame.maxY + infoLabel.frame.height)
        
        self.addSubview(timeLabel)
        self.addSubview(lineView)
        self.addSubview(dayLabel)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawRect(rect: CGRect) {
        let hourRedius = self.frame.height * (3/10)
        let roundAngle = startAngle + 2 * M_PI

        drawCircle(redius: hourRedius, endAngle: roundAngle, lineWidth: hourLineWidth, lineColor: baseColor, isDash: false)
        drawCircle(redius: hourRedius, endAngle: startAngle + Double(clockViewModel.shorthand()) * 2 * M_PI, lineWidth: hourLineWidth, lineColor: color, isDash: false)
        
        let minRadius = hourRedius - (hourLineWidth + 2)
        drawCircle(redius: minRadius, endAngle: roundAngle, lineWidth: minuteLineWidth, lineColor: baseColor, isDash: false)
        drawCircle(redius: minRadius, endAngle: startAngle + Double(clockViewModel.longhand()) * 2 * M_PI, lineWidth: minuteLineWidth, lineColor: color, isDash: false)
        
        let secRadius = minRadius - (minuteLineWidth + 4)
        drawCircle(redius: secRadius, endAngle: roundAngle, lineWidth: secoundLineWidth, lineColor: baseColor, isDash: false)
        drawCircle(redius: secRadius, endAngle: startAngle + Double(clockViewModel.secondhand()) * 2 * M_PI, lineWidth: secoundLineWidth, lineColor: color, isDash: false)
        
        drawCircle(redius: secRadius - secoundLineWidth - 5, endAngle: roundAngle, lineWidth: 5, lineColor: baseColor, isDash: true)
    }
    
    func drawCircle(redius radius: CGFloat, endAngle: Double, lineWidth: CGFloat, lineColor: UIColor, isDash: Bool) {
        let path = UIBezierPath(arcCenter: center, radius: radius,  startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        path.lineWidth = lineWidth
        lineColor.setStroke()
        if isDash {
            path.setLineDash([1.0, 5.0], count: 2, phase: 0)
        }
        path.stroke()
    }

}
