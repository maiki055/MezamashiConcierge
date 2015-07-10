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

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Area"
        view.backgroundColor = UIColor.mainColor()
        tableView.customDelegate = self
        for area in areas {
            tableView.dataArray.append(area.name)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: CommomTableViewDelegate
    func commonTableView(commonTableView: CommonTableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("pushRouteViewController", sender: nil)
    }

}
