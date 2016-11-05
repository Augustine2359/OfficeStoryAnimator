//
//  CustomTextView.swift
//  OfficeStoryAnimator
//
//  Created by Augustine Cheong on 2016/11/06.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import Foundation
import Cocoa

class CustomTextView: NSTextView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        font = NSFont(name: font!.fontName, size: 15)
    }
    
    override init(frame frameRect: NSRect, textContainer container: NSTextContainer?) {
        super.init(frame: frameRect, textContainer: container)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        layer?.borderWidth = 1
        layer?.borderColor = NSColor.black.cgColor
        layer?.cornerRadius = 10
    }
}
