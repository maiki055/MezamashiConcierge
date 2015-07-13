//
//  PersonTableViewCell.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/12.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont.boldFont(12)
        titleLabel.text = "居住地の選択"
        
        let line = UIView(frame: CGRect(x: 30, y: viewHeight(self) - 0.5, width: viewWidth(self) - 60, height: 0.5))
        line.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        line.autoresizingMask = .FlexibleTopMargin | .FlexibleWidth
        contentView.addSubview(line)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
