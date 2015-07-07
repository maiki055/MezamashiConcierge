//
//  User.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/23.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class User: Model {
    static let currentUser = User()
    var uuid: String?
    
    override init() {
        super.init()
        
        setUUID()
    }
    
    func isAuthenticated() -> Bool {
        return true
    }
    
    func createUser() {
        if uuid != nil {
            return
        }
        Alamofire.request(.POST, "http://localhost:4000/api/v1/users/sign_up", parameters: nil, encoding: .JSON)
            .responseJSON { (request, response, data, error) -> Void in
                let objs = JSON(data!)
                self.uuid = objs["uuid"].string!
                self.saveUUID()
        }
    }
    
    func saveUUID() {
        if let uuid = self.uuid {
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setObject(uuid, forKey: "uuid")
        }
    }
    
    func setUUID() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let uuid = (userDefaults.objectForKey("uuid") as? String) {
            self.uuid = uuid
        }
    }
}
