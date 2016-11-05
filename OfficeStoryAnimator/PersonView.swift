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
        self.rotate(byDegrees: direction)
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        image = Bundle.main.image(forResource: "person.png")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
