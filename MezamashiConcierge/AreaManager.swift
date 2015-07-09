//
//  AreaManager.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/10.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class AreaManager: ManagerModel {
    static let sharedManager = ConciergeMenuManager()
    var areas = [Area]()
    
    override init() {
        super.init()
        
        areas = fetchAreas()
    }
    
    func fetchAreas() -> Array<Area> {
        let area1 = Area()
        area1.name = "北海道"
        let area2 = Area()
        area2.name = "東北"
        let area3 = Area()
        area3.name = "関東"
        let area4 = Area()
        area4.name = "中部"
        let area5 = Area()
        area5.name = "近畿"
        let area6 = Area()
        area6.name = "中国"
        let area7 = Area()
        area7.name = "四国"
        let area8 = Area()
        area8.name = "九州"
        
        return [area1, area2, area3, area4, area5, area6, area7, area8]
    }
}
