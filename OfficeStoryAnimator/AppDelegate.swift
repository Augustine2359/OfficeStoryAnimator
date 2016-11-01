//
//  AppDelegate.swift
//  OfficeStoryAnimator
//
//  Created by Augustine Cheong on 2016/11/01.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let controller = OfficeViewController(nibName: "OfficeView", bundle: Bundle.main)
        window.contentView?.addSubview((controller?.view)!)
        var rect: NSRect = (window.contentView?.frame)!
        rect.origin = CGPoint.zero
        controller?.view.frame = rect
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

