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

    let facingUpAngle:CGFloat = 90
    let facingLeftAngle:CGFloat = 180
    let facingDownAngle:CGFloat = -90
    let facingRightAngle:CGFloat = 0
    
    var mePerson: PersonView?
    var deptHeadPerson: PersonView?
    var pmPerson: PersonView?

    var animationCommands: [Any] = []
    
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
        
        var rotateToPersonTuple = (turningPersonView: pmPerson!, targetPersonView: mePerson!)
        animationCommands.append(rotateToPersonTuple)
        var rotateToAngleTuple = (personView: pmPerson!, rotation: facingLeftAngle)
        animationCommands.append(rotateToAngleTuple)
        var translateTuple = (personView: mePerson!, translation: NSPoint(x: -100, y: 0))
        animationCommands.append(translateTuple)
        rotateToAngleTuple = (personView: mePerson!, rotation: facingUpAngle)
        animationCommands.append(rotateToAngleTuple)
        translateTuple = (personView: mePerson!, translation: NSPoint(x: 0, y: 325))
        animationCommands.append(translateTuple)
        rotateToAngleTuple = (personView: mePerson!, rotation: facingRightAngle)
        animationCommands.append(rotateToAngleTuple)
        translateTuple = (personView: mePerson!, translation: NSPoint(x: 400, y: 0))
        animationCommands.append(translateTuple)
        rotateToAngleTuple = (personView: mePerson!, rotation: facingDownAngle)
        animationCommands.append(rotateToAngleTuple)
        translateTuple = (personView: mePerson!, translation: NSPoint(x: 0, y: -200))
        animationCommands.append(translateTuple)
        rotateToPersonTuple = (turningPersonView: mePerson!, targetPersonView: pmPerson!)
        animationCommands.append(rotateToPersonTuple)
    }

    func executeAnimationCommands() {
        if (animationCommands.count == 0) {
            return
        }

        let superself = self
        
        let animationCommand = animationCommands.removeFirst()
        if let rotateCommand = animationCommand as? (turningPersonView: PersonView, targetPersonView: PersonView) {
            Swift.print("rotating to person")
            rotateCommand.turningPersonView.turnTo(otherPerson: rotateCommand.targetPersonView, completionHandler: { 
                self.executeAnimationCommands()
            })
            return
        }

        if let translateCommand = animationCommand as? (personView: PersonView, translation: NSPoint) {
            Swift.print("moving")
            let animation = NSViewAnimation(duration: 0.5, animationCurve: NSAnimationCurve.linear)
            var newFrame = translateCommand.personView.frame
            newFrame.origin.x += translateCommand.translation.x
            newFrame.origin.y += translateCommand.translation.y
            let dictionary = [NSViewAnimationTargetKey: translateCommand.0,
                              NSViewAnimationStartFrameKey: NSValue(rect: translateCommand.personView.frame),
                              NSViewAnimationEndFrameKey: NSValue(rect: newFrame)]
            animation.viewAnimations.append(dictionary)
            animation.delegate = superself
            animation.start()
            return
        }
        
        if let rotateCommand = animationCommand as? (personView: PersonView, rotation: CGFloat) {
            Swift.print("looking at something")
            rotateCommand.personView.turnTo(angle: rotateCommand.rotation, completionHandler: {
                self.executeAnimationCommands()
            })
            return
        }
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()

        executeAnimationCommands()

        return        
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

extension OfficeViewController: NSAnimationDelegate {
    func animationDidEnd(_ animation: NSAnimation) {
        executeAnimationCommands()
    }
}
