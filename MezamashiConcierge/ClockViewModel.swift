//
//  ClockViewModel.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/24.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class ClockViewModel: NSObject {
    let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
    var comps = (0, 0, 0, 0)
    let fullhours: Float   = 24
    let fullMinutes: Float = 60
    let fullSeconds: Float = 60
    
    var date: NSDate = NSDate() {
        didSet {
            configureComps()
        }
    }
    
    func configureComps() {
        calendar.getHour(&comps.0, minute: &comps.1, second: &comps.2, nanosecond: &comps.3, fromDate: date)
    }
    
    func shorthand() -> Float {
        return Float(comps.0) / fullhours
    }
    
    func longhand() -> Float {
        return Float(comps.1) / fullMinutes
    }
    
    func secondhand() -> Float {
        return Float(comps.2) / fullSeconds
    }
}
