//
//  MenuTableViewCell.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/26.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var enSubTitleLabel: UILabel!
    @IBOutlet weak var jaSubTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont.alphanumericFont(20)
        enSubTitleLabel.font = UIFont.alphanumericFont(16)
        jaSubTitleLabel.font = UIFont.font(12)
        
        titleLabel.textColor = UIColor.subColor02()
        enSubTitleLabel.textColor = UIColor.subColor01()
        jaSubTitleLabel.textColor = UIColor.subColor01()
        
        titleLabel.text = "Station"
        enSubTitleLabel.text = "change the nearest route"
        jaSubTitleLabel.text = "最寄りの路線を変更"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
