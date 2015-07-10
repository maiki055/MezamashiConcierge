//
//  HeaderMessageView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/10.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class HeaderMessageView: UIView {
    @IBOutlet weak var label: UILabel!
    var message = "" {
        didSet {
            if let unwrappedLabel = label {
                unwrappedLabel.text = message
            }
            
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let subView = NSBundle.mainBundle().loadNibNamed("HeaderMessageView", owner: self, options: nil)[0] as! UIView;
        self.addSubview(subView)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.font = UIFont.font(12)
    }
}
