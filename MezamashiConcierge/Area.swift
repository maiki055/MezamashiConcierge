//
//  Area.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/10.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit
import SwiftyJSON

class Area: Model {
    var name = ""
    var railroadCompanies = [RailroadCompany]()
    var prefectures = [Prefecture]()
    
    override init(json: JSON) {
        super.init(json: json)
        
        name = json["name"].string!
        for (index: String, subJson: JSON) in json["railroad_companies"] {
            let railroadCompany = RailroadCompany(json: subJson)
            self.railroadCompanies.append(railroadCompany)
        }
        for (index: String, subJson: JSON) in json["prefectures"] {
            let prefecture = Prefecture(json: subJson)
            self.prefectures.append(prefecture)
        }
    }
}
