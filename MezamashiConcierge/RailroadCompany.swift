//
//  RailroadCompany.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/10.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit
import SwiftyJSON

class RailroadCompany: Model {
    var name = ""
    var railroads = [Railroad]()
    
    override init(json: JSON) {
        super.init(json: json)
        
        name = json["name"].string!
        for (index: String, subJson: JSON) in json["railroads"] {
            let railroad = Railroad(json: subJson)
            self.railroads.append(railroad)
        }
    }
}
