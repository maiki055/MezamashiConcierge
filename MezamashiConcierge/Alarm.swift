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
import AVFoundation

class Alarm: Model {
    var date = NSDate()
    var fileName = "alarm"
    var fileType = "m4r"
    var isOn = false
    var alarmPlayer: AVAudioPlayer!
    var alarmTimer: NSTimer?
    
    func on() {
        isOn = true
        alarmTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "alarmTimerEvent", userInfo: nil, repeats: true)
    }
    
    func off() {
        isOn = false
        alarmTimer?.invalidate()
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
    
    func isValid() -> Bool {
        return NSDate().compare(date) == .OrderedAscending
    }
    
    func startAlarm() {
        off()
        println("start!!!")
        if let path = NSBundle.mainBundle().pathForResource("alarm", ofType: "m4r") {
            let fileURL = NSURL(fileURLWithPath: path)
            var error:NSError?
            alarmPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: &error)
            if let unwrappedError = error {
                println("Error \(unwrappedError.localizedDescription)")
            }
            else {
                alarmPlayer.prepareToPlay()
                alarmPlayer.play()
            }
        }
    }
    
    func stopAlarm() {
        alarmPlayer.stop()
        alarmTimer?.invalidate()
    }
    
    func alarmTimerEvent() {
        println(date)
        println(NSDate())
        if NSDate().compare(date) == .OrderedDescending {
            startAlarm()
        }
    }
}
