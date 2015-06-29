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
    
    func jaMessage() -> String {
        switch self {
        case .NoSettingAlarm:
            return "アラームは設定されていません。"
        case .SettingAlarm:
            return "アラーム設定済み"
        }
    }
    
    func enMessage() -> String {
        switch self {
        case .NoSettingAlarm:
            return "not setting alarm."
        case .SettingAlarm:
            return "setting alarm."
        }
    }
    
    func buttons() -> Array<String> {
        switch self {
        case .NoSettingAlarm:
            return ["アラームを設定", "おまかせ設定"]
        case .SettingAlarm:
            return ["アラーム取り消し"]
        }
    }
}