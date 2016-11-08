//
//  OfficeView.swift
//  OfficeStoryAnimator
//
//  Created by Augustine Cheong on 2016/11/01.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import Foundation
import Cocoa

class PersonView: NSImageView {
    init(frame frameRect: NSRect, direction: CGFloat, isVIP: Bool) {
        super.init(frame: frameRect)
        image = isVIP ? Bundle.main.image(forResource: "vip.png") : Bundle.main.image(forResource: "person.png")
        frameCenterRotation = direction
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        image = Bundle.main.image(forResource: "person.png")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func turnTo(otherPerson: PersonView, completionHandler: @escaping (()->Void)) {
        let y = otherPerson.frame.midY - frame.midY
        let x = otherPerson.frame.midX - frame.midX
        var finalAngle = atan(y/x) / CGFloat(M_PI) * 180
        if (x < 0 && y < 0) {
            finalAngle += 180
        }

        turnTo(angle: finalAngle, completionHandler: completionHandler)
    }
    
    func turnTo(angle: CGFloat, completionHandler: @escaping (()->Void)) {
        Swift.print("initial frame is ")
        Swift.print(frame)
        NSAnimationContext.beginGrouping()
        NSAnimationContext.current().duration = 0.5
        NSAnimationContext.current().completionHandler = {
            Swift.print("final frame is ")
            Swift.print(self.frame)
            Swift.print("animator frame is ")
            Swift.print(self.animator().frame)
            completionHandler()
        }
        animator().frameCenterRotation = angle
        NSAnimationContext.endGrouping()
    }
}
