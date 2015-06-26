//
//  ConciergeViewController.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/26.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class ConciergeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.mainColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TouchEvent
    @IBAction func didSelectCancelButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
