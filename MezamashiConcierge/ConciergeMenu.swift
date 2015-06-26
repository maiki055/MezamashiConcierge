//
//  ConciergeMenu.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/26.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class ConciergeMenu: Model {
    var title = ""
    var enSubTitle = ""
    var jaSubTitle = ""
    
    init(attributes: Dictionary<String, String>) {
        super.init()
        
        self.updateByAttributes(attributes, key: "title")
        self.updateByAttributes(attributes, key: "enSubTitle")
        self.updateByAttributes(attributes, key: "jaSubTitle")
    }
}
