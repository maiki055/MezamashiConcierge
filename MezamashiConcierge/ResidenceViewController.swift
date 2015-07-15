//
//  ResidenceViewController.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/15.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class ResidenceViewController: UIViewController {
    var area: Area!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Residence"
        view.backgroundColor = UIColor.mainColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
