//
//  OfficeView.swift
//  OfficeStoryAnimator
//
//  Created by Augustine Cheong on 2016/11/01.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import Foundation
import Cocoa

class PersonView: NSView {
    var completionHandler: (()->Void)?
    var imageView: NSImageView

    init(frame frameRect: NSRect, direction: CGFloat, isVIP: Bool) {
        imageView = NSImageView(frame: NSRect(x: 0, y: 0, width: frameRect.width, height: frameRect.height))
        imageView.autoresizingMask = [.viewWidthSizable, .viewHeightSizable]
        imageView.image = isVIP ? Bundle.main.image(forResource: "vip.png") : Bundle.main.image(forResource: "person.png")
        super.init(frame: frameRect)
        addSubview(imageView)
        imageView.frameCenterRotation = direction
    }
    
    override init(frame frameRect: NSRect) {
        imageView = NSImageView(frame: NSRect(x: 0, y: 0, width: frameRect.width, height: frameRect.height))
        imageView.autoresizingMask = [.viewWidthSizable, .viewHeightSizable]
        imageView.image = Bundle.main.image(forResource: "person.png")
        super.init(frame: frameRect)
        addSubview(imageView)
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
        NSAnimationContext.beginGrouping()
        NSAnimationContext.current().duration = 0.5
        NSAnimationContext.current().completionHandler = completionHandler
        imageView.animator().frameCenterRotation = angle
        NSAnimationContext.endGrouping()
    }
}
