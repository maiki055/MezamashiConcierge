//
//  PersonalViewController.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/12.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class PersonalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    let titles = ["居住地の選択", "二度寝頻度"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Personal"
        view.backgroundColor = UIColor.mainColor()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .None
        tableView.registerNib(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PersonTableViewCell
        cell.titleLabel.text = titles[indexPath.row]
        let switchButtonCollection = SwitchButtonCollection(frame: CGRectMake(30, (viewHeight(cell) - 20) / 2 + 20, viewWidth(cell) - 60, 20))
        switchButtonCollection.createButtons(["よくする", "たまにする", "ない"])
        cell.contentView.addSubview(switchButtonCollection)

        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

}
