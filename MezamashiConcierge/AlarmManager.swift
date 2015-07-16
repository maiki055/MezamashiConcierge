//
//  AlarmManager.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class AlarmManager: NSObject {
    static let sharedManager = AlarmManager()
    
    dynamic var isOn = false
    var activeAlarm: Alarm?
    
    func setAlarm(alarm: Alarm) {
        isOn = true
        activeAlarm = alarm
        activeAlarm?.on()
        UIApplication.sharedApplication().idleTimerDisabled = true
    }
    
    func removeAlarm() {
        activeAlarm?.off()
        activeAlarm = nil
        isOn = false
        UIApplication.sharedApplication().idleTimerDisabled = false
    }
}
