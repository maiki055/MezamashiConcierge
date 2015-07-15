//
//  ResidenceViewController.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/15.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class ResidenceViewController: UIViewController, CommomTableViewDelegate {
    var area: Area!
    @IBOutlet weak var tableView: ResidenceTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Residence"
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
        let city = area.prefectures[indexPath.section].cities[indexPath.row]
        User.currentUser.patchUserCity(city.id)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
