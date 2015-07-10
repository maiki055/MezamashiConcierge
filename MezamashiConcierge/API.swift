//
//  API.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/10.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MRProgress

class API: NSObject {
    static let DomainURL = "http://localhost:4000/"
    static let Version = "v1"
    
    class func baseURL() -> String {
        return DomainURL + "api/" + Version + "/"
    }
    
    // MARK: Progress
    class func showProgress() {
        let overlayView = MRProgressOverlayView.showOverlayAddedTo(appWindow(), animated: true)
        overlayView.backgroundColor = UIColor.color(decRed: 70, decGreen: 50, decBlue: 35, alpha: 0.6)
        overlayView.setTintColor(UIColor.subColor02())
        overlayView.titleLabel.textColor = UIColor.color(decRed: 40, decGreen: 40, decBlue: 40, alpha: 1)
        overlayView.titleLabel.font = UIFont.boldFont(14)
    }
    
    class func hideProgress() {
        MRProgressOverlayView.dismissOverlayForView(appWindow(), animated: true)
    }
    
    // MARK: Alert
    class func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        appWindow().rootViewController!.presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: HTTP
    class func authenticated() -> Bool {
        if !User.currentUser.isAuthenticated() {
            return false
        }
        let manager = Manager.sharedInstance
        manager.session.configuration.HTTPAdditionalHeaders = ["X-Auth-Token": User.currentUser.uuid!]
        return true
    }
    
    class func request(method: Alamofire.Method, route: String, parameters: [String : AnyObject]?, needAuth: Bool, success: ((json: JSON) -> Void)?, failure: ((error: NSError?) -> Void)?, always: ((request: NSURLRequest, response: NSHTTPURLResponse?, data: AnyObject?, error: NSError?) -> Void)?) {
        if needAuth {
            if !authenticated() {
                showAlert("認証エラーが起きました。お手数ですがアプリケーションの再起動をお願いします。")
                return
            }
        }
        showProgress()
        Alamofire.request(method, baseURL() + route, parameters: parameters, encoding: .JSON)
            .responseJSON { (request, response, data, error) -> Void in
                self.hideProgress()
                if let _always = always {
                    _always(request: request, response: response, data: data, error: error)
                }
                if error == nil {
                    let json = JSON(data!)
                    if let errorMessage = json["error"].string {
                        self.showAlert(errorMessage)
                        if let _failure = failure {
                            _failure(error: nil)
                        }
                        return
                    }
                    if let _success = success {
                        _success(json: json)
                    }
                }
                else {
                    println(error)
                    self.showAlert("予期せぬエラーが発生しました。少し時間をおいてからもう一度お試しください。")
                    if let _failure = failure {
                        _failure(error: error)
                    }
                }
                
        }
    }
}
