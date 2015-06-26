//
//  ViewController.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var alarmView: ClockView!
    var messageView: MessageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mainColor()
        
        let rects = allocateRects()
        let alarmViewWidth = rects.0
        let alarmViewHeight = rects.1
        var innerMargin: CGFloat = rects.2
        alarmView = ClockView(frame: CGRect(x: (view.frame.width - alarmViewWidth) / 2, y: (view.frame.height - alarmViewHeight - 200) / 2, width: alarmViewWidth, height: alarmViewHeight))
        messageView = UINib(nibName: "MessageView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! MessageView
        messageView.frame = CGRect(x: 0, y: alarmView.frame.maxY + innerMargin, width: view.frame.width, height: 200)
        let callConciergeView = CallConciergeView()
        self.view.addSubview(alarmView)
        self.view.addSubview(messageView)
        self.view.addSubview(callConciergeView)
        
        update()
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "update", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        alarmView.date = NSDate()
        alarmView.setNeedsDisplay()
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
}

