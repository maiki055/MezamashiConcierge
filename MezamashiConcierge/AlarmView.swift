//
//  AlarmView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class AlarmView: ClockView, MovingPointDelegate {
    let alarm = Alarm()
    var lowerDate: NSDate!
    var upperDate: NSDate!
    let hourMovingPoint = MovingPoint()
    let minMovingPoint = MovingPoint()
    var movePoint: MovingPoint!
    var dating: NSDate!
    var hour = 0
    var min  = 0
    let calendar = NSCalendar.currentCalendar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        hourMovingPoint.componentType = .Hour
        hourMovingPoint.constantRadius = hourRadius
        hourMovingPoint.setSize(CGSize(width: self.hourLineWidth * 1.5, height: self.hourLineWidth * 1.5))
        hourMovingPoint.center = CGPoint(x: viewWidth(self) / 2, y: viewHeight(self) / 2 - hourMovingPoint.constantRadius)
        hourMovingPoint.backgroundColor = self.color
        hourMovingPoint.delegate = self
        
        minMovingPoint.componentType = .Min
        minMovingPoint.constantRadius = minRadius
        minMovingPoint.setSize(CGSize(width: self.minuteLineWidth * 1.5, height: self.minuteLineWidth * 1.5))
        minMovingPoint.center = CGPoint(x: viewWidth(self) / 2, y: viewHeight(self) / 2 - minMovingPoint.constantRadius)
        minMovingPoint.backgroundColor = self.color
        minMovingPoint.delegate = self
        
        self.addSubview(hourMovingPoint)
        self.addSubview(minMovingPoint)
        
        prepareDate()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareDate() {
        date = NSDate()
        lowerDate = date
        upperDate = NSDate(timeIntervalSinceNow: 24*60*60)
        
        let components = calendar.components(NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitMinute, fromDate: date)
        hour = components.hour
        min  = components.minute
        hourMovingPoint.radian = Double(hour) / 24 * 2 * M_PI
        justifyCenter(hourMovingPoint)
        minMovingPoint.radian = Double(min) / 60 * 2 * M_PI
        justifyCenter(minMovingPoint)
        
        let dateString = String(format: "%04d/%02d/%02d", components.year, components.month, components.day)
        dating = dateFormatterEra.dateFromString(dateString)!
    }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
    }
    
    func movingPoint(movingPoint: MovingPoint, touchesMoved touches: Set<NSObject>, withEvent event: UIEvent) {
        let relativePoints = getTouchRelativePoint(touches)
        movingPoint.radian = atan2(-Double(relativePoints.0), -Double(relativePoints.1)) + M_PI
            
        switch movingPoint.componentType {
        case .Hour:
            let newHour = movingPoint.time
            if newHour == 0 && hour == 23 {
                dating = NSDate(timeInterval: 24*60*60, sinceDate: dating)
            }
            else if hour == 0 && newHour == 23 {
                dating = NSDate(timeInterval: -24*60*60, sinceDate: dating)
            }
            hour = movingPoint.time
        case .Min:
            min = movingPoint.time
        }
        let schedulingDate = calendar.dateBySettingHour(hour, minute: min, second: 0, ofDate: dating, options: nil)!
        alarm.date = schedulingDate
        self.date = alarm.date
        justifyCenter(movingPoint)
        self.setNeedsDisplay()
    }
    
    private func isValidAlarmDate(schedulingDate: NSDate) -> Bool {
        if lowerDate.compare(schedulingDate) == .OrderedDescending {
            return false
        }
        else if upperDate.compare(schedulingDate) == .OrderedAscending {
            return false
        }
        return true
    }
    
    private func justifyCenter(movePoint: MovingPoint) {
        let x = Double(movePoint.constantRadius) * sin(movePoint.radian)
        let y = -Double(movePoint.constantRadius) * cos(movePoint.radian)
        movePoint.center = CGPoint(x: CGFloat(x) + viewWidth(self) / 2, y: CGFloat(y) + viewHeight(self) / 2)
    }
    
    private func getTouchRelativePoint(touches: Set<NSObject>) -> (relativeTouchX: CGFloat, relativeTouchY: CGFloat) {
        let touch = touches.first as? UITouch
        var position = CGPointZero
        if let _touch = touch {
            position = _touch.locationInView(self)
        }
        let relativeTouchX = position.x - (viewWidth(self) / 2)
        let relativeTouchY = -(position.y - (viewHeight(self) / 2))
        
        return (relativeTouchX, relativeTouchY)
    }
}
