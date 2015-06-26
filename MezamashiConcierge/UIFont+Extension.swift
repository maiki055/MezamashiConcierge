//
//  UIFont+Extension.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

extension UIFont {
    class func font(size: CGFloat) -> UIFont {
        return UIFont(name: "HiraMinProN-W3", size: fontSize(fontSize: size))!
    }
    class func boldFont(size: CGFloat) -> UIFont {
        return UIFont(name: "HiraMinProN-W6", size: fontSize(fontSize: size))!
    }
    class func alphanumericFont(size: CGFloat) -> UIFont {
        return UIFont(name: "SavoyeLetPlain", size: fontSize(fontSize: size))!
    }
    class func alphanumericBoldFont(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue", size: fontSize(fontSize: size))!
    }
    
    class func fontSize(fontSize size: CGFloat) -> CGFloat {
//        if Devise.Is_3_5_Inch() {
//            return size * 0.8
//        }
//        else if Devise.Is_4_7_Inch() {
//            return size * 1.2
//        }
//        else if Devise.Is_5_5_Inch() {
//            return size * 1.5
//        }
        return size
    }
}
