//
//  AreaViewController.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/10.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class AreaViewController: UIViewController, CommomTableViewDelegate {
    @IBOutlet weak var tableView: CommonTableView!
    var areas = AreaManager.sharedManager.areas
    var area: Area!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Area"
        view.backgroundColor = UIColor.mainColor()
        tableView.customDelegate = self
        for area in areas {
            tableView.dataArray.append(area.name)
        }
        navigationItem.clearBackButtonTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: CommomTableViewDelegate
    func commonTableView(commonTableView: CommonTableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        area = areas[indexPath.row]
        self.performSegueWithIdentifier("pushRouteViewController", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let routeViewController = segue.destinationViewController as! RouteViewController
        routeViewController.area = area
    }
}
