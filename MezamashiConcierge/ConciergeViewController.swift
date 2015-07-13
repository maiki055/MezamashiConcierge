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
    let menus = ConciergeMenuManager.sharedManager.menus

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.mainColor()
        tableView.registerNib(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "Menu")
        
        navigationItem.clearBackButtonTitle()
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
        return menus.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Menu", forIndexPath: indexPath) as! MenuTableViewCell
        cell.menu = menus[indexPath.row]
        cell.setNeedsLayout()
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let segue = menus[indexPath.row].segue
        if segue != "" {
            self.performSegueWithIdentifier(segue, sender: self)
        }
        else {
            let alert = UIAlertController(title: "近日公開", message: "この機能は近日公開される機能です。アップデートをお待ち下さい", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

}
