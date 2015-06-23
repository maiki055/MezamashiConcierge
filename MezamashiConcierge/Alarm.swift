//
//  Alarm.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class Alarm: Model {
    var isOn = false
    
    func on() {
        isOn = true
    }
    
    func off() {
        isOn = false
    }
}
