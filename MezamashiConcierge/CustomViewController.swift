//
//  CustomViewController.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/11.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Custom"
        view.backgroundColor = UIColor.mainColor()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .None
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.registerNib(UINib(nibName: "UITableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        let switchButtonCollection = SwitchButtonCollection(frame: CGRectMake(40, (viewHeight(cell) - 20) / 2, viewWidth(cell) - 80, 20))
        switchButtonCollection.createButtons(["Fast", "Normal", "Slow"])
        cell.contentView.addSubview(switchButtonCollection)
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = CustomTableViewSection(frame: CGRect(x: 0, y: 0, width: viewWidth(tableView), height: 35))
        return sectionView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
}
