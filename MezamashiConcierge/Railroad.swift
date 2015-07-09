//
//  Railroad.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/10.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

enum RailroadStatus: Int {
    case Usually
    case Delay
    case Stop
}

class Railroad: Model {
    var name = ""
    var state = ""
    var stateDetail = ""
    var status: RailroadStatus = .Usually
}
