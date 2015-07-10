//
//  Model.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit
import SwiftyJSON

class Model: NSObject {
    var id = 0
    
    override init() {
        super.init()
    }
    
    init(json: JSON) {
        if let id = json["id"].int {
          self.id = id
        }
    }

    func updateByAttributes(attributes: Dictionary<String, AnyObject>, key: String) {
        if let value: AnyObject = attributes[key] {
            self.setValue(value, forKey: key)
        }
    }
}
