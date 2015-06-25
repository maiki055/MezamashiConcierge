//
//  UIColor+Extension.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

extension UIColor {
    class func color(#decRed: CGFloat, decGreen: CGFloat, decBlue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: decRed/255.0, green: decGreen/255.0, blue: decBlue/255.0, alpha: alpha)
    }
    class func mainColor() -> UIColor {
        return color(decRed: 0, decGreen: 0, decBlue: 0, alpha: 1)
    }
    class func subColor01() -> UIColor {
        return color(decRed: 255, decGreen: 255, decBlue:2550, alpha: 1)
    }
    class func subColor02() -> UIColor {
        return color(decRed: 208, decGreen: 176, decBlue: 134, alpha: 1)
    }
}

