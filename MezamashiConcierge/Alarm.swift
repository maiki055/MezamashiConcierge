//
//  Alarm.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Alarm: Model {
    var date = NSDate()
    var fileName = "alarm"
    var fileType = "m4r"
    var isOn = false
    
    func on() {
        isOn = true
    }
    
    func off() {
        isOn = false
    }
    
    func updateAlarm() {
        let manager = Manager.sharedInstance
        manager.session.configuration.HTTPAdditionalHeaders = ["X-Auth-Token": User.currentUser.uuid!]
        request(.GET, "http://localhost:3000/api/v1/alarms/my_alarm", parameters: nil, encoding: .JSON)
            .responseJSON { (request, response, data, error) -> Void in
                let objs = JSON(data!)
                println(objs)
        }
    }
    
    func alarmMessage() -> String {
        let formatter = NSDateFormatter()
        let local = NSLocale(localeIdentifier: "en_US")
        formatter.locale = local
        formatter.dateFormat = "MM月dd日のHH時mm分"
        return formatter.stringFromDate(date)
    }
}
