//
//  UINavigationItem+Extension.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/10.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

extension UINavigationItem {
    func clearBackButtonTitle() {
        let backButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        self.backBarButtonItem = backButtonItem
    }
}
