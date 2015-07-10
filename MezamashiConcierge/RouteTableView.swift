//
//  RouteTableView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/10.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class RouteTableView: CommonTableView, UITableViewDataSource, UITableViewDelegate {
    var area: Area!
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        prepareView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareView()
    }
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return area.railroadCompanies.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return area.railroadCompanies[section].railroads.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CommonTableViewCell
        cell.label?.text = area.railroadCompanies[indexPath.section].railroads[indexPath.row].name
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth(self), height: 20))
        sectionView.backgroundColor = UIColor.color(decRed: 119, decGreen: 92, decBlue: 65, alpha: 1)
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: viewWidth(sectionView) - 20, height: viewHeight(sectionView)))
        label.font = UIFont.font(11)
        label.text = area.railroadCompanies[section].name
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        sectionView.addSubview(label)
        
        return sectionView
    }
}
