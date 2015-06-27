//
//  NetworkConnectivity.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/27.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class NetworkConnectivity: NSObject {
    let reachability = MCReachability.reachabilityForInternetConnection()
    var isReachable = false
    
    override init() {
        super.init()
        
        startNotifier()
    }
    
    func checkReachability() {
        if reachability.isReachable() {
            notifyReachable()
        } else {
            notifyNotReachable()
        }
    }
    
    func startNotifier() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityChanged:", name: ReachabilityChangedNotification, object: reachability)
        reachability.startNotifier()
    }
    
    func reachabilityChanged(note: NSNotification) {
        if reachability.isReachable() {
            notifyReachable()
        }
        else {
            notifyNotReachable()
        }
    }
    
    func notifyReachable() {
        isReachable = true
    }
    
    func notifyNotReachable() {
        isReachable = false
        let alertController = UIAlertController(title: "ネットワークに接続されていません", message: "ネットワーク接続がない状態では、天候の情報や運行情報を取得できません", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        appDelegate().window?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
    }
}
