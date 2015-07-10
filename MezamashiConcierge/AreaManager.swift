//
//  AreaManager.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/10.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AreaManager: ManagerModel {
    static let sharedManager = AreaManager()
    var areas = [Area]()
    
    override init() {
        super.init()
    }
    
    func fetchAreas() {
        areas.removeAll(keepCapacity: false)
        API.request(Method.GET, route: "areas", parameters: nil, needAuth: false, success: { (json) -> Void in
            for (index: String, subJson: JSON) in json["areas"] {
                let area = Area(json: subJson)
                self.areas.append(area)
            }
        }, failure: nil, always: nil)
    }
}
