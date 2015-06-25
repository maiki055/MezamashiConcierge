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
        return UIFont(name: "HiraMinProN-W3", size: fontSize)!
    }
    class func boldFont(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "HiraMinProN-W6", size: fontSize)!
    }
    class func alphanumericFont(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "SavoyeLetPlain", size: fontSize)!
    }
    class func alphanumericBoldFont(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue", size: fontSize)!
    }
}
