//
//  City.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/11.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit
import SwiftyJSON

class City: Model {
    var name = ""
    
    override init(json: JSON) {
        super.init(json: json)
        
        name = json["name"].string!
    }
}
