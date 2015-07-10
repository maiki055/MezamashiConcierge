//
//  CommonTableView.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/10.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

@objc protocol CommomTableViewDelegate {
    optional func commonTableView(commonTableView: CommonTableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
}

class CommonTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    var dataArray = [String]()
    weak var customDelegate: CommomTableViewDelegate?

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        prepareView()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareView()
    }
    
    func prepareView() {
        backgroundColor = UIColor.clearColor()
        separatorStyle = .None
        dataSource = self
        delegate = self
        registerNib(UINib(nibName: "CommonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CommonTableViewCell
        cell.label?.text = dataArray[indexPath.row]
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        customDelegate?.commonTableView?(self, didSelectRowAtIndexPath: indexPath)
    }
}
