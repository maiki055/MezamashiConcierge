//
//  CommonConst.swift
//  melo
//
//  Created by shinbo maiki on 2015/01/02.
//  Copyright (c) 2015年 新保 麻粋. All rights reserved.
//

import UIKit

func appDelegate() -> AppDelegate {
    return UIApplication.sharedApplication().delegate as! AppDelegate
}

func appWindow() -> UIWindow {
    return appDelegate().window!
}

func viewHeight(view: UIView) -> CGFloat {
    return CGRectGetHeight(view.frame)
}

func viewWidth(view: UIView) -> CGFloat {
    return CGRectGetWidth(view.frame)
}

func viewMaxX(view: UIView) -> CGFloat {
    return CGRectGetMaxX(view.frame)
}

func viewMaxY(view: UIView) -> CGFloat {
    return CGRectGetMaxY(view.frame)
}

func viewMinX(view: UIView) -> CGFloat {
    return CGRectGetMinX(view.frame)
}

func viewMinY(view: UIView) -> CGFloat {
    return CGRectGetMinY(view.frame)
}