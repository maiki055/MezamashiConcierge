//
//  ConciergeViewController.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/26.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class ConciergeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: MenuTableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.mainColor()
        tableView.registerNib(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "Menu")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TouchEvent
    @IBAction func didSelectCancelButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Menu", forIndexPath: indexPath) as! MenuTableViewCell
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

}
