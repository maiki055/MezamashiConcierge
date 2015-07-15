//
//  ResidenceTableView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/15.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class ResidenceTableView: CommonTableView, UITableViewDataSource, UITableViewDelegate {
    var area: Area!
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return area.prefectures.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return area.prefectures[section].cities.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CommonTableViewCell
        cell.label?.text = area.prefectures[indexPath.section].cities[indexPath.row].name
        
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
        label.text = area.prefectures[section].name
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        sectionView.addSubview(label)
        
        return sectionView
    }
}
