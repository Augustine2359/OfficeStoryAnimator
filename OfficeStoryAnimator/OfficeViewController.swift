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
    let tableGroup1x: Double = 100
    let tableGroup1y: Double = 100
    let standardTableWidth: Double = 75
    let standardTableHeight: Double = 75

    let standardPersonWidth: Double = 75
    let standardPersonHeight: Double = 75

    let facingLeftAngle:CGFloat = 180
    let facingDownAngle:CGFloat = -90

    override func viewDidLoad() {
        super.viewDidLoad()

        let scrollView = NSScrollView(frame: NSRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        scrollView.autoresizingMask = [.viewHeightSizable, .viewWidthSizable]
        scrollView.hasHorizontalScroller = true
        view.addSubview(scrollView)

        let tableGroup1Rects = groupOfTableRectsFromXAndY(x: tableGroup1x, y: tableGroup1y)
        let tableGroup2Rects = groupOfTableRectsFromXAndY(x: tableGroup1x + 400, y: tableGroup1y)
        let tableGroup3Rects = groupOfTableRectsFromXAndY(x: tableGroup1x + 800, y: tableGroup1y)

        let subView = NSView(frame: NSRect(x: 0, y: 0, width: 1500, height: 1500))
        for rect in tableGroup1Rects {
            let tableView = TableView(frame: rect)
            subView.addSubview(tableView)
        }
        for rect in tableGroup2Rects {
            let tableView = TableView(frame: rect)
            subView.addSubview(tableView)
        }
        for rect in tableGroup3Rects {
            let tableView = TableView(frame: rect)
            subView.addSubview(tableView)
        }

        var persons = personViews(fromX: 25, y: tableGroup1y)
        for personView in persons {
            subView.addSubview(personView)
        }

        persons = personViews(fromX: 425, y: tableGroup1y)
        for personView in persons {
            subView.addSubview(personView)
        }

        persons = personViews(fromX: 825, y: tableGroup1y)
        for personView in persons {
            subView.addSubview(personView)
        }

        scrollView.documentView = subView
    }
  
    func groupOfTableRectsFromXAndY(x:Double, y:Double) -> [NSRect] {
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
    
    func personViews(fromX x:Double, y:Double) -> [PersonView] {
        var personViews: [PersonView] = []
        
        var personViewRect = NSRect(x: x, y: y, width: standardPersonWidth, height: standardPersonHeight)
        
        personViews.append(PersonView(frame: personViewRect, direction: 0, isVIP: false))

        personViewRect.origin.y += CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: 0, isVIP: false))

        personViewRect.origin.y += CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: 0, isVIP: false))

        personViewRect.origin.y += CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: 0, isVIP: false))

        personViewRect.origin.y += CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: 0, isVIP: false))

        personViewRect.origin.y += CGFloat(standardPersonHeight*2)
        personViewRect.origin.x += CGFloat(standardPersonWidth + standardTableWidth/2)
        personViews.append(PersonView(frame: personViewRect, direction: facingDownAngle, isVIP: false))
        
        personViewRect.origin.y -= CGFloat(standardPersonHeight*2)
        personViewRect.origin.x += CGFloat(standardPersonWidth + standardTableWidth/2)
        personViews.append(PersonView(frame: personViewRect, direction: facingLeftAngle, isVIP: false))
        
        personViewRect.origin.y -= CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: facingLeftAngle, isVIP: false))

        personViewRect.origin.y -= CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: facingLeftAngle, isVIP: false))

        personViewRect.origin.y -= CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: facingLeftAngle, isVIP: false))

        personViewRect.origin.y -= CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: facingLeftAngle, isVIP: false))

        return personViews
    }
    
}
