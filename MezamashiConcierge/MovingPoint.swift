//
//  MovingPoint.swift
//  MezamashiConcierge
//
//  Created by shinbo maiki on 2015/06/28.
//  Copyright (c) 2015年 shinbo maiki. All rights reserved.
//

import UIKit

@objc protocol MovingPointDelegate {
    optional func movingPoint(movingPoint: MovingPoint, touchesBegan touches: Set<NSObject>, withEvent event: UIEvent)
    optional func movingPoint(movingPoint: MovingPoint, touchesMoved touches: Set<NSObject>, withEvent event: UIEvent)
    optional func movingPoint(movingPoint: MovingPoint, touchesEnded touches: Set<NSObject>, withEvent event: UIEvent)
}

enum AlarmComponents {
    case Hour
    case Min
    
    func calcTime(radian: Double) -> Int {
        switch self {
        case .Hour:
          return Int(radian / (2 * M_PI) * 24)
        case .Min:
          return Int(radian / (2 * M_PI) * 60)
        }
    }
}

class MovingPoint: UIView {
    var constantRadius: CGFloat = 0
    var componentType: AlarmComponents = .Hour
    var time = 0
    var radian: Double = 0 {
        didSet {
            time = componentType.calcTime(radian)
        }
    }
    weak var delegate: MovingPointDelegate?

    func setSize(size: CGSize) {
        self.frame.size = size
        self.layer.cornerRadius = viewWidth(self) / 2
    }
    
    func hasTouchedInside(pointX x: CGFloat, pointY y: CGFloat) -> Bool {
        let boundary = constantRadius - 5
        if (x <= boundary && x >= -boundary) {
            if (y <= boundary && y >= -boundary) {
                return true
            }
        }
        return false
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        delegate?.movingPoint?(self, touchesBegan: touches, withEvent: event)
    }

    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        delegate?.movingPoint?(self, touchesMoved: touches, withEvent: event)
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        delegate?.movingPoint?(self, touchesEnded: touches, withEvent: event)
    }
}
