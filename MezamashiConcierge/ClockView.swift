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
    var hourRadius: CGFloat = 0
    var minRadius:  CGFloat = 0
    var secRadius:  CGFloat = 0
    let hourLineWidth:    CGFloat = 10
    let minuteLineWidth:  CGFloat = 5
    let secoundLineWidth: CGFloat = 2
    let color     = UIColor.subColor02()
    let baseColor = UIColor.subColor02Light()
    
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
        let local = NSLocale(localeIdentifier: "en_US")
        dateFormatterHour.locale = local
        dateFormatterHour.dateFormat = "HH:mm"
        dateFormatterEra.locale = local
        dateFormatterEra.dateFormat = "yyyy/MM/dd"
        
        hourRadius = self.frame.width * (3/10)
        minRadius = hourRadius - (hourLineWidth + 2)
        secRadius = minRadius - (minuteLineWidth + 4)
        
        timeLabel.text = "00:00"
        timeLabel.font = UIFont.alphanumericFont(55)
        timeLabel.textAlignment = NSTextAlignment.Center
        timeLabel.textColor = UIColor.subColor01()
        timeLabel.sizeToFit()
        timeLabel.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        
        let lineView = UIView(frame: CGRect(x: viewMinX(timeLabel), y: viewMaxY(timeLabel) - 20, width: viewWidth(timeLabel), height: 1))
        lineView.backgroundColor = UIColor.subColor01()
        
        dayLabel.text = "0000/00/00"
        dayLabel.font = UIFont.alphanumericFont(20)
        dayLabel.textAlignment = NSTextAlignment.Center
        dayLabel.textColor = UIColor.subColor01()
        dayLabel.sizeToFit()
        dayLabel.center = CGPoint(x: viewWidth(self) / 2, y: viewMaxY(lineView) + viewHeight(dayLabel))
        
        self.addSubview(timeLabel)
        self.addSubview(lineView)
        self.addSubview(dayLabel)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawRect(rect: CGRect) {
        let roundAngle = startAngle + 2 * M_PI

        // Draw Base Circle
        drawCircle(redius: hourRadius, endAngle: roundAngle, lineWidth: hourLineWidth, lineColor: baseColor, isDash: false)
        drawCircle(redius: minRadius, endAngle: roundAngle, lineWidth: minuteLineWidth, lineColor: baseColor, isDash: false)
        drawCircle(redius: secRadius, endAngle: roundAngle, lineWidth: secoundLineWidth, lineColor: baseColor, isDash: false)
        
        // Draw DateTime Circle
        drawCircle(redius: hourRadius, endAngle: startAngle + Double(clockViewModel.shorthand()) * 2 * M_PI, lineWidth: hourLineWidth, lineColor: color, isDash: false)
        drawCircle(redius: minRadius, endAngle: startAngle + Double(clockViewModel.longhand()) * 2 * M_PI, lineWidth: minuteLineWidth, lineColor: color, isDash: false)
        
        drawCircle(redius: secRadius, endAngle: startAngle + Double(clockViewModel.secondhand()) * 2 * M_PI, lineWidth: secoundLineWidth, lineColor: color, isDash: false)
        
        // Draw Dash Circle
        drawCircle(redius: secRadius - secoundLineWidth - 5, endAngle: roundAngle, lineWidth: 5, lineColor: baseColor, isDash: true)
    }
    
    func drawCircle(redius radius: CGFloat, endAngle: Double, lineWidth: CGFloat, lineColor: UIColor, isDash: Bool) {
        let center = CGPoint(x: viewWidth(self) / 2, y: viewHeight(self) / 2)
        let path = UIBezierPath(arcCenter: center, radius: radius,  startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        path.lineWidth = lineWidth
        lineColor.setStroke()
        if isDash {
            path.setLineDash([1.0, 8.0], count: 2, phase: 0)
        }
        path.stroke()
    }

}
