//
//  UIFont+Extension.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

extension UIFont {
    class func font(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "HiraKakuProN-W3", size: fontSize)!
    }
    class func boldFont(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "HiraKakuProN-W6", size: fontSize)!
    }
}
