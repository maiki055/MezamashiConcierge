//
//  ViewController.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, CallConciergeViewDelegate, MessageViewDelegate {
    var clockView: ClockView!
    var messageView: MessageView!
    var alarmPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mainColor()
        
        let rects = allocateRects()
        let alarmViewWidth = rects.0
        let alarmViewHeight = rects.1
        var innerMargin: CGFloat = rects.2
        clockView = ClockView(frame: CGRect(x: (view.frame.width - alarmViewWidth) / 2, y: (view.frame.height - alarmViewHeight - 200) / 2, width: alarmViewWidth, height: alarmViewHeight))
        messageView = UINib(nibName: "MessageView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! MessageView
        messageView.frame = CGRect(x: 0, y: clockView.frame.maxY + innerMargin, width: view.frame.width, height: 200)
        messageView.delegate = self
        let callConciergeView = CallConciergeView()
        callConciergeView.delegate = self
        self.view.addSubview(clockView)
        self.view.addSubview(messageView)
        self.view.addSubview(callConciergeView)

        update()
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "update", userInfo: nil, repeats: true)
        AlarmManager.sharedManager.addObserver(self, forKeyPath: "isOn", options: .Initial | .New, context: nil)
    }
    
    deinit {
        AlarmManager.sharedManager.removeObserver(self, forKeyPath: "isOn")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        clockView.date = NSDate()
        clockView.setNeedsDisplay()
    }
    
    // MARK: Alarm
    func beginSetAlerm() {
        performSegueWithIdentifier("presentModallAlarmViewController", sender: self)
    }
    
    func endSetAlerm() {
    }
    
    func startAlarm() {
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
    }
    
    func allocateRects() -> (alarmWidth: CGFloat, alarmHeight: CGFloat, innerMargin: CGFloat) {
        var alarmViewWidth:  CGFloat = 0
        var alarmViewHeight: CGFloat = 0
        var innerMargin:     CGFloat = 0
        
        // iPhone4S
        if view.frame.height == 480 {
            alarmViewWidth = 300
            alarmViewHeight = 200
        }
        // iPhone5
        else if view.frame.height == 568 {
            alarmViewWidth = view.frame.width
            alarmViewHeight = 250
        }
        // iPhone6
        else if view.frame.height == 667 {
            alarmViewWidth = view.frame.width
            alarmViewHeight = 300
        }
        // iPhone6 Plus
        else if view.frame.height == 736 {
            alarmViewWidth = view.frame.width
            alarmViewHeight = alarmViewWidth
        }
        
        return (alarmViewWidth, alarmViewHeight, innerMargin)
    }
    
    // MARK: CallConciergeViewDelegate
    func callConciergeViewDidSelect(callConciergeView: CallConciergeView) {
        self.performSegueWithIdentifier("presentModallyConciergeViewController", sender: self)
    }
    
    // MARK: MessageViewDelegate
    func messageView(messageView: MessageView, didSelectAlermButton button: UIButton) {
        beginSetAlerm()
    }
    
    func messageView(messageView: MessageView, didSelectLeaveButton button: UIButton) {
        let alertController = UIAlertController(title: "おまかせ設定", message: "アラームを明日の08:30に設定いたしました", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        AlarmManager.sharedManager.isOn = true
    }
    
    func messageView(messageView: MessageView, didSelectCancelButton button: UIButton) {
        let alertController = UIAlertController(title: "アラームの解除", message: "アラームを解除しました", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        AlarmManager.sharedManager.isOn = false
    }
    
    // Key Value Observer
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if keyPath == "isOn" {
            if change["new"] as! Bool {
                messageView.messageViewModel = MessageStatus.SettingAlarm
            }
            else {
                messageView.messageViewModel = MessageStatus.NoSettingAlarm
            }
        }
    }
}

