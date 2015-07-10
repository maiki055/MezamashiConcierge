//
//  CommonTableViewCell.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/10.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class CommonTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.font = UIFont.font(12)
        label.textColor = UIColor.subColor02()
        
        let line = UIView(frame: CGRect(x: 8, y: viewHeight(self) - 0.5, width: viewWidth(self) - 16, height: 0.5))
        line.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        line.autoresizingMask = .FlexibleTopMargin | .FlexibleRightMargin | .FlexibleLeftMargin
        contentView.addSubview(line)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
