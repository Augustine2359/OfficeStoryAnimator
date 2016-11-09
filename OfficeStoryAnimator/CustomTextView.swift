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
    init(speaker: PersonView, text: String) {
        var frame = speaker.frame
        frame.size.width *= 2
        frame.origin.x += 50
        super.init(frame: frame)
        font = NSFont(name: font!.fontName, size: 20)
        string = text

        layoutManager?.ensureLayout(for: textContainer!)
        let usedRect = layoutManager?.usedRect(for: textContainer!)
        frame.size.width = usedRect!.width
        frame.size.height = usedRect!.height
        self.frame = frame
    }

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
