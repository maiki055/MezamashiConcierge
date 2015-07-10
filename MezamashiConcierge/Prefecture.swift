//
//  Prefecture.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/11.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit
import SwiftyJSON

class Prefecture: Model {
    var name = ""
    var cities = [City]()
    
    override init(json: JSON) {
        super.init(json: json)
        
        name = json["name"].string!
        for (index: String, subJson: JSON) in json["cities"] {
            let city = City(json: subJson)
            self.cities.append(city)
        }
    }
}
