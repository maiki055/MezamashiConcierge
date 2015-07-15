//
//  AlarmView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class AlarmView: ClockView {
    let alarm = Alarm()
    var lowerDate: NSDate!
    var upperDate: NSDate!
    let hourMovingPoint = MovingPoint()
    let minMovingPoint = MovingPoint()
    var movePoint: MovingPoint!
    var hour = 0
    var min = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        hourMovingPoint.componentType = .Hour
        hourMovingPoint.constantRadius = hourRadius
        hourMovingPoint.setSize(CGSize(width: self.hourLineWidth * 1.5, height: self.hourLineWidth * 1.5))
        hourMovingPoint.center = CGPoint(x: viewWidth(self) / 2, y: viewHeight(self) / 2 - hourMovingPoint.constantRadius)
        hourMovingPoint.backgroundColor = self.color
        
        minMovingPoint.componentType = .Min
        minMovingPoint.constantRadius = minRadius
        minMovingPoint.setSize(CGSize(width: self.minuteLineWidth * 1.5, height: self.minuteLineWidth * 1.5))
        minMovingPoint.center = CGPoint(x: viewWidth(self) / 2, y: viewHeight(self) / 2 - minMovingPoint.constantRadius)
        minMovingPoint.backgroundColor = self.color
        
        self.addSubview(hourMovingPoint)
        self.addSubview(minMovingPoint)
        
        prepareDate()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareDate() {
        date = NSDate()
        lowerDate = date
        upperDate = NSDate(timeIntervalSinceNow: 24*60*60)
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitMinute, fromDate: date)
        
        hourMovingPoint.radian = Double(components.hour) / 24 * 2 * M_PI
        justifyCenter(hourMovingPoint)
        minMovingPoint.radian = Double(components.minute) / 60 * 2 * M_PI
        justifyCenter(minMovingPoint)
    }

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let relativePoints = getTouchRelativePoint(touches)
        if (minMovingPoint.hasTouchedInside(pointX: relativePoints.0, pointY: relativePoints.1)) {
            movePoint = minMovingPoint
        }
        else {
            movePoint = hourMovingPoint
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        movePoint = nil
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let unwrappedMovePoint = movePoint {
            let relativePoints = getTouchRelativePoint(touches)
            unwrappedMovePoint.radian = atan2(-Double(relativePoints.0), -Double(relativePoints.1)) + M_PI
            justifyCenter(unwrappedMovePoint)
            
            switch movePoint.componentType {
            case .Hour:
                hour = movePoint.time
            case .Min:
                min = movePoint.time
            }
            let dateString = String(format: "%02d:%02d", hour, min)
            alarm.date = self.dateFormatterHour.dateFromString(dateString)!
            self.date = alarm.date
            self.setNeedsDisplay()
        }
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
