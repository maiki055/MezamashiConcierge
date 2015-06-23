//
//  ViewController.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var alarmView: AlarmView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mainColor()
        
        alarmView = AlarmView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width))
        self.view.addSubview(alarmView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

