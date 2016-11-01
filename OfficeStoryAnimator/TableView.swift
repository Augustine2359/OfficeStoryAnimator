//
//  OfficeView.swift
//  OfficeStoryAnimator
//
//  Created by Augustine Cheong on 2016/11/01.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import Foundation
import Cocoa

class TableView: NSView {
    override func draw(_ dirtyRect: NSRect) {
        layer?.backgroundColor = NSColor.brown.cgColor
        layer?.borderColor = NSColor.black.cgColor
        layer?.borderWidth = 1
    }
}
