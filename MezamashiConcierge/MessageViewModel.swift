//
//  MessageViewModel.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/25.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

enum MessageStatus {
    case NoSettingAlarm
    case SettingAlarm
}

class MessageViewModel: NSObject {
    var jaMessage = "アラームは設定されていません。"
    var enMessage = "not setting alarm."
    var status: MessageStatus = .NoSettingAlarm
}
