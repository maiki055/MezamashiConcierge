//
//  PersonTableView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/12.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class PersonTableView: UITableView {
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        prepareView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareView()
    }
    
    func prepareView() {
        separatorStyle = .None
    }
}
