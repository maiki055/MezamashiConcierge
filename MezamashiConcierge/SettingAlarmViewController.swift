//
//  SettingAlarmViewController.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/28.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class SettingAlarmViewController: UIViewController, ButtonsWrapperViewDelegate {
    var alarmView: AlarmView!
    let alarm = Alarm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mainColor()
        
        let rects = allocateRects()
        let alarmViewWidth = rects.0
        let alarmViewHeight = rects.1
        var innerMargin: CGFloat = rects.2
        alarmView = AlarmView(frame: CGRect(x: (view.frame.width - alarmViewWidth) / 2, y: (view.frame.height - alarmViewHeight - 200) / 2, width: alarmViewWidth, height: alarmViewHeight))
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: (viewMinY(alarmView) - 20) / 2 + 20, width: viewWidth(self.view), height: 20))
        messageLabel.text = "アラームの時間を設定してください"
        messageLabel.font = UIFont.font(12)
        messageLabel.textColor = UIColor.subColor01()
        messageLabel.textAlignment = NSTextAlignment.Center
        
        let buttonsWrapperView = UINib(nibName: "ButtonsWrapperView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! ButtonsWrapperView
        buttonsWrapperView.frame = CGRect(x: 0, y: viewMaxY(alarmView), width: viewWidth(self.view), height: 100)
        buttonsWrapperView.leftButton.setTitle("設定する", forState: .Normal)
        buttonsWrapperView.rightButton.setTitle("キャンセル", forState: .Normal)
        buttonsWrapperView.delegate = self
        
        self.view.addSubview(alarmView)
        self.view.addSubview(messageLabel)
        self.view.addSubview(buttonsWrapperView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func allocateRects() -> (alarmWidth: CGFloat, alarmHeight: CGFloat, innerMargin: CGFloat) {
        var alarmViewWidth:  CGFloat = 0
        var alarmViewHeight: CGFloat = 0
        var innerMargin:     CGFloat = 0
        
        // iPhone4S
        if view.frame.height == 480 {
            alarmViewWidth = 300
            alarmViewHeight = 200
        }
            // iPhone5
        else if view.frame.height == 568 {
            alarmViewWidth = view.frame.width
            alarmViewHeight = 250
        }
            // iPhone6
        else if view.frame.height == 667 {
            alarmViewWidth = view.frame.width
            alarmViewHeight = 300
        }
            // iPhone6 Plus
        else if view.frame.height == 736 {
            alarmViewWidth = view.frame.width
            alarmViewHeight = alarmViewWidth
        }
        
        return (alarmViewWidth, alarmViewHeight, innerMargin)
    }
    
    // MARK: TouchEvent
    func didSelectSettingButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: ButtonsWrapperViewDelegate
    func buttonsWrapperView(buttonsWrapperView: ButtonsWrapperView, didSelectLeftButton: UIButton) {
        let alertController = UIAlertController(title: "設定の完了", message: "アラームを明日の08:30に設定いたしました", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default) { (alertAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        alertController.addAction(defaultAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        AlarmManager.sharedManager.isOn = true
    }
    
    func buttonsWrapperView(buttonsWrapperView: ButtonsWrapperView, didSelectRightButton: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
