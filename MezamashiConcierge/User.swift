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
        return uuid != nil
    }
    
    func createUser() {
        if uuid != nil {
            return
        }
        
        API.request(Alamofire.Method.POST, route: "users/sign_up", parameters: nil, needAuth: false, success: { (json) -> Void in
            self.uuid = json["uuid"].string!
            self.saveUUID()
            }, failure: nil, always: nil)
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
    
    func patchUserRailroad(railroad_id: Int) {
        API.request(Alamofire.Method.PATCH, route: "users/railroad", parameters: ["railroad_id": railroad_id], needAuth: true, success: { (json) -> Void in
            print(json)
        }, failure: nil, always: nil)
    }
    
    func patchUserCity(city_id: Int) {
        API.request(Alamofire.Method.PATCH, route: "users/city", parameters: ["city_id": city_id], needAuth: true, success: { (json) -> Void in
            print(json)
            }, failure: nil, always: nil)
    }
}
