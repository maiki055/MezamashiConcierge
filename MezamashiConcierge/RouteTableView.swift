//
//  RouteTableView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/10.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class RouteTableView: CommonTableView, UITableViewDataSource, UITableViewDelegate {

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
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CommonTableViewCell
        cell.label?.text = "東急東横線"
        
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
        let section = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth(self), height: 20))
        section.backgroundColor = UIColor.color(decRed: 119, decGreen: 92, decBlue: 65, alpha: 1)
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: viewWidth(section) - 20, height: viewHeight(section)))
        label.font = UIFont.font(11)
        label.text = "JR東日本"
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        section.addSubview(label)
        
        return section
    }
}
