//
//  CustomTableViewSection.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/11.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class CustomTableViewSection: UIView {
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareView()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareView() {
        backgroundColor = UIColor.mainColor()
        titleLabel = UILabel(frame: CGRect(x: 40, y: 0, width: viewWidth(self) - 80, height: viewHeight(self)))
        titleLabel.font = UIFont.font(12)
        titleLabel.text = "歩行速度"
        titleLabel.textColor = UIColor.subColor02()
//        titleLabel.textAlignment = .Center
        titleLabel.autoresizingMask = .FlexibleTopMargin | .FlexibleRightMargin | .FlexibleBottomMargin | .FlexibleLeftMargin
        let line = UIView(frame: CGRect(x: 20, y: viewHeight(self) - 0.5, width: viewWidth(self) - 40, height: 0.5))
        line.backgroundColor = UIColor.subColor02()
        line.autoresizingMask = .FlexibleTopMargin | .FlexibleRightMargin | .FlexibleLeftMargin
        self.addSubview(titleLabel)
        self.addSubview(line)
    }
}
