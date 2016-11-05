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
    let tableGroup1y: Double = 200
    let standardTableWidth: Double = 75
    let standardTableHeight: Double = 75

    let standardPersonWidth: Double = 75
    let standardPersonHeight: Double = 75

    let facingLeftAngle:CGFloat = 180
    let facingDownAngle:CGFloat = -90

    var mePerson: PersonView?
    var deptHeadPerson: PersonView?
    var pmPerson: PersonView?

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

        var persons = personViews(fromX: 25, y: tableGroup1y, hasVIPs: false)
        for personView in persons {
            subView.addSubview(personView)
        }

        persons = personViews(fromX: 425, y: tableGroup1y, hasVIPs: true)
        for personView in persons {
            subView.addSubview(personView)
        }

        persons = personViews(fromX: 825, y: tableGroup1y, hasVIPs: false)
        for personView in persons {
            subView.addSubview(personView)
        }
        
        scrollView.documentView = subView
        
//        let textView = CustomTextView(frame: NSRect(x: 0, y: 100, width: 100, height: 100))
//        textView.string = "hello"
//        subView.addSubview(textView)
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        
        mePerson?.turnTo(otherPerson: deptHeadPerson!)
        pmPerson?.turnTo(otherPerson: mePerson!)
        deptHeadPerson?.turnTo(otherPerson: pmPerson!)
        return
        
        let basicAnimation = CABasicAnimation(keyPath: "position")
        basicAnimation.fromValue = NSValue(point: mePerson!.frame.origin)
        basicAnimation.toValue = NSValue(point: NSPoint(x:0, y:0))
        basicAnimation.duration = 1
        mePerson!.frame = NSRect(x: 0, y: 0, width: 100, height: 100)
        mePerson!.layer?.add(basicAnimation, forKey: "position")
        return
        
        let animation: NSViewAnimation = NSViewAnimation()
        Swift.print(mePerson)
        let dictionary = [NSViewAnimationTargetKey: mePerson,
                          NSViewAnimationStartFrameKey: NSValue(rect: (mePerson!.frame)),
                          NSViewAnimationEndFrameKey: NSValue(rect: NSRect(x:0, y:0, width: 100, height:100))] as [String : Any]
        animation.viewAnimations.append(dictionary)
        animation.start()
        //        animation.viewAnimations.append(<#T##newElement: Element##Element#>)
        //        let animation = NSViewAnimation(viewAnimations: <#T##[[String : Any]]#>)
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
    
    func personViews(fromX x:Double, y:Double, hasVIPs:Bool) -> [PersonView] {
        var personViews: [PersonView] = []
        
        var personViewRect = NSRect(x: x, y: y, width: standardPersonWidth, height: standardPersonHeight)
        
        personViews.append(PersonView(frame: personViewRect, direction: 0, isVIP: false))

        personViewRect.origin.y += CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: 0, isVIP: false))

        personViewRect.origin.y += CGFloat(standardPersonHeight)
        if (hasVIPs) {
            mePerson = PersonView(frame: personViewRect, direction: 0, isVIP: true)
            personViews.append(mePerson!)
        }
        else {
            personViews.append(PersonView(frame: personViewRect, direction: 0, isVIP: false))
        }

        personViewRect.origin.y += CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: 0, isVIP: false))

        personViewRect.origin.y += CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: 0, isVIP: false))

        personViewRect.origin.y += CGFloat(standardPersonHeight*2)
        personViewRect.origin.x += CGFloat(standardPersonWidth + standardTableWidth/2)
        if (hasVIPs) {
            deptHeadPerson = PersonView(frame: personViewRect, direction: facingDownAngle, isVIP: true)
            personViews.append(deptHeadPerson!)
        }
        else {
            personViews.append(PersonView(frame: personViewRect, direction: facingDownAngle, isVIP: false))
        }
        
        personViewRect.origin.y -= CGFloat(standardPersonHeight*2)
        personViewRect.origin.x += CGFloat(standardPersonWidth + standardTableWidth/2)
        personViews.append(PersonView(frame: personViewRect, direction: facingLeftAngle, isVIP: false))
        
        personViewRect.origin.y -= CGFloat(standardPersonHeight)
        if (hasVIPs) {
            pmPerson = PersonView(frame: personViewRect, direction: facingLeftAngle, isVIP: true)
            personViews.append(pmPerson!)
        }
        else {
            personViews.append(PersonView(frame: personViewRect, direction: facingLeftAngle, isVIP: false))
        }

        personViewRect.origin.y -= CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: facingLeftAngle, isVIP: false))

        personViewRect.origin.y -= CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: facingLeftAngle, isVIP: false))

        personViewRect.origin.y -= CGFloat(standardPersonHeight)
        personViews.append(PersonView(frame: personViewRect, direction: facingLeftAngle, isVIP: false))

        return personViews
    }
    
}
