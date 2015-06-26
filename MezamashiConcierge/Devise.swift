//
//  Devise.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/26.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

enum deviseHeights: CGFloat {
    case Inch3_5 = 480
    case Inch4   = 568
    case Inch4_7 = 667
    case Inch5_5 = 736
}

struct Devise {
    static let currentDevice = UIDevice.currentDevice()
    static let screenHeight = UIScreen.mainScreen().bounds.size.height
    
    static func isSize(height: deviseHeights) -> Bool {
        return screenHeight == height.rawValue
    }
    
    static func Is_3_5_Inch() -> Bool {
        return isSize(.Inch3_5)
    }
    
    static func Is_4_Inch() -> Bool {
        return isSize(.Inch4)
    }
    
    static func Is_4_7_Inch() -> Bool {
        return isSize(.Inch4_7)
    }
    
    static func Is_5_5_Inch() -> Bool {
        return isSize(.Inch5_5)
    }
}