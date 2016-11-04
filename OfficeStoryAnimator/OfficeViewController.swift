//
//  OfficeViewController.swift
//  OfficeStoryAnimator
//
//  Created by Augustine Cheong on 2016/11/01.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import Foundation
import Cocoa

class OfficeViewController: NSViewController {
    let tableGroup1x = 100
    let tableGroup1y = 100
    let standardTableWidth = 100
    let standardTableHeight = 100

    override func viewDidLoad() {
        super.viewDidLoad()

        let scrollView = NSScrollView(frame: NSRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        scrollView.autoresizingMask = [.viewHeightSizable, .viewWidthSizable]
        scrollView.hasHorizontalScroller = true
        view.addSubview(scrollView)

        let tableGroup1Rects: [NSRect] = groupOfTableRectsFromXAndY(x: tableGroup1x, y: tableGroup1y)

        let subView = NSView(frame: NSRect(x: 0, y: 0, width: 1500, height: 1500))
        for rect in tableGroup1Rects {
            let tableView = TableView(frame: rect)
            subView.addSubview(tableView)
        }

//        let personView = PersonView(frame: NSRect(x: 1000, y: 0, width: 100, height: 100))
//        subview.addSubview(personView)
        scrollView.documentView = subView
    }
  
    func groupOfTableRectsFromXAndY(x:Int, y:Int) -> [NSRect] {
        var tableGroupRects: [NSRect] = []
        tableGroupRects.append(NSRect(x: x, y: y, width: standardTableWidth, height: standardTableHeight))
        tableGroupRects.append(NSRect(x: x, y: y + standardTableHeight, width: standardTableWidth, height: standardTableHeight))
        tableGroupRects.append(NSRect(x: x, y: y + standardTableHeight*2, width: standardTableWidth, height: standardTableHeight))
        tableGroupRects.append(NSRect(x: x, y: y + standardTableHeight*3, width: standardTableWidth, height: standardTableHeight))
        tableGroupRects.append(NSRect(x: x, y: y + standardTableHeight*4, width: standardTableWidth, height: standardTableHeight))
        tableGroupRects.append(NSRect(x: x + standardTableWidth, y: y, width: standardTableWidth, height: standardTableHeight))
        tableGroupRects.append(NSRect(x: x + standardTableWidth, y: y + standardTableHeight, width: standardTableWidth, height: standardTableHeight))
        tableGroupRects.append(NSRect(x: x + standardTableWidth, y: y + standardTableHeight*2, width: standardTableWidth, height: standardTableHeight))
        tableGroupRects.append(NSRect(x: x + standardTableWidth, y: y + standardTableHeight*3, width: standardTableWidth, height: standardTableHeight))
        tableGroupRects.append(NSRect(x: x + standardTableWidth, y: y + standardTableHeight*4, width: standardTableWidth, height: standardTableHeight))
        tableGroupRects.append(NSRect(x: x, y: y + standardTableHeight*5, width: 2*standardTableWidth, height: standardTableHeight))
        
        return tableGroupRects
    }
}
