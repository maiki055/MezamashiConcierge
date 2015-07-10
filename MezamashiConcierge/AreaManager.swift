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
//        let manager = Manager.sharedInstance
//        manager.session.configuration.HTTPAdditionalHeaders = ["X-Auth-Token": User.currentUser.uuid!]
        areas.removeAll(keepCapacity: false)
        request(.GET, "http://localhost:4000/api/v1/areas", parameters: nil, encoding: .JSON)
            .responseJSON { (request, response, data, error) -> Void in
                let json = JSON(data!)
                for (index: String, subJson: JSON) in json["areas"] {
                    let area = Area(json: subJson)
                    self.areas.append(area)
                }
        }
    }
}
