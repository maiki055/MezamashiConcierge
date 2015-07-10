//
//  RouteViewController.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/26.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class RouteViewController: UIViewController, CommomTableViewDelegate {
    var area: Area!
    @IBOutlet weak var tableView: RouteTableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Route"
        view.backgroundColor = UIColor.mainColor()
        tableView.customDelegate = self
        tableView.area = area
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: CommomTableViewDelegate
    func commonTableView(commonTableView: CommonTableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let railroad = area.railroadCompanies[indexPath.section].railroads[indexPath.row]
        User.currentUser.patchUserRailroad(railroad.id)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
