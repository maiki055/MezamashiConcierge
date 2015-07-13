//
//  ConciergeMenuManager.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/26.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class ConciergeMenuManager: ManagerModel {
    static let sharedManager = ConciergeMenuManager()
    var menus = [ConciergeMenu]()
    
    override init() {
        super.init()
        
        menus = createMenus()
    }
    
    func createMenus() -> Array<ConciergeMenu> {
        let menu1 = ConciergeMenu(attributes: [
            "title": "Route",
            "enSubTitle": "change the nearest route",
            "jaSubTitle": "最寄りの路線を変更",
            "segue": "pushAreaOfRouteViewController"])
        let menu2 = ConciergeMenu(attributes: [
            "title": "Residence",
            "enSubTitle": "change your place of residence",
            "jaSubTitle": "居住地を変更",
            "segue": "pushAreaOfResidenceViewController"])
        let menu3 = ConciergeMenu(attributes: [
            "title": "EasterEgg",
            "enSubTitle": "the function that will be coming soon",
            "jaSubTitle": "近日公開機能",
            "segue": ""])

//        let menu2 = ConciergeMenu(attributes: [
//            "title": "Custom",
//            "enSubTitle": "teach the habit",
//            "jaSubTitle": "習慣を教える",
//            "segue": "pushCustomViewController"])
//        let menu3 = ConciergeMenu(attributes: [
//            "title": "Personal",
//            "enSubTitle": "edit personal information",
//            "jaSubTitle": "個人情報の編集",
//            "segue": "pushPersonalViewController"])
        
        return [menu1, menu2, menu3]
    }
}
