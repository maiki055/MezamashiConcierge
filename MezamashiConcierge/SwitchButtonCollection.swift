//
//  SwitchButtonCollection.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/07/11.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

class SwitchButtonCollection: UIView, SwitchButtonDelegate {
    var index = 0
    var switchButtons = [SwitchButton]()
    
    func createButtons(titles: Array<String>) {
        let height = viewHeight(self)
        let width = viewWidth(self) / CGFloat(titles.count)
        for (index, title) in enumerate(titles) {
            let switchButton = SwitchButton(frame: CGRect(x: width * CGFloat(index), y: 0, width: width, height: height))
            switchButton.tag = index
            switchButton.delegate = self
            switchButton.textLabel.text = title
            self.addSubview(switchButton)
            switchButtons.append(switchButton)
        }
        switchButtons[0].selected = true
    }
    
    // MARK: SwitchButtonDelegate
    func switchButton(switchButton: SwitchButton, shouldSelectButton button: UIButton) -> Bool {
        if switchButton.selected {
            return false
        }
        switchButtons[index].selected = false
        if let _index = find(switchButtons, switchButton) {
            index = _index
        }
        return true
    }
}
