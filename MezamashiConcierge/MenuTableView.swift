//
//  MenuTableView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/26.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class MenuTableView: UITableView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
//        backgroundColor = UIColor.color(decRed: 90, decGreen: 66, decBlue: 46, alpha: 1)
        backgroundColor = UIColor.clearColor()
        contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

}
