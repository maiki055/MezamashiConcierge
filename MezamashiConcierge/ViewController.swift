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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mainColor()
        
        alarmView = ClockView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width))
        self.view.addSubview(alarmView)
        
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

}

