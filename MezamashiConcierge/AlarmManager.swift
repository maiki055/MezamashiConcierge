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
}
