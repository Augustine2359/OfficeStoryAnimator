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
    var direction: Float
    
    init(frame frameRect: NSRect, direction: Float, isVIP: Bool) {
        self.direction = direction
        super.init(frame: frameRect)
        image = isVIP ? Bundle.main.image(forResource: "vip.png") : Bundle.main.image(forResource: "person.png")
    }
    
    override init(frame frameRect: NSRect) {
        self.direction = 0
        super.init(frame: frameRect)
        image = Bundle.main.image(forResource: "person.png")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
