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
    var ghostMePerson: PersonView?
    
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
        
        ghostMePerson = PersonView(frame: mePerson!.frame, direction: facingRightAngle, isVIP: true)
        ghostMePerson?.alphaValue = 0
        subView.addSubview(ghostMePerson!)
        
        scrollView.documentView = subView
        
        var waitDuration:Double = 5
        animationCommands.append(waitDuration)
        var textTuple = (speaker: mePerson!, text: "ENGINEER")
        animationCommands.append(textTuple)
        textTuple = (speaker: pmPerson!, text: "PROJECT MANAGER")
        animationCommands.append(textTuple)
        textTuple = (speaker: deptHeadPerson!, text: "DEPARTMENT HEAD")
        animationCommands.append(textTuple)
        var rotateToPersonTuple = (turningPersonView: pmPerson!, targetPersonView: mePerson!)
        animationCommands.append(rotateToPersonTuple)
        textTuple = (speaker: pmPerson!, text: "Hey could you come here for a while?")
        animationCommands.append(textTuple)
        textTuple = (speaker: pmPerson!, text: "I need to consult you on something.")
        animationCommands.append(textTuple)
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
        translateTuple = (personView: mePerson!, translation: NSPoint(x: 0, y: -125))
        animationCommands.append(translateTuple)
        rotateToPersonTuple = (turningPersonView: mePerson!, targetPersonView: pmPerson!)
        animationCommands.append(rotateToPersonTuple)
        textTuple = (speaker: mePerson!, text: "What is it?")
        animationCommands.append(textTuple)
        textTuple = (speaker: pmPerson!, text: " (consult) ")
        animationCommands.append(textTuple)
        textTuple = (speaker: mePerson!, text: " (discuss) ")
        animationCommands.append(textTuple)
        textTuple = (speaker: pmPerson!, text: " (consult) ")
        animationCommands.append(textTuple)
        textTuple = (speaker: mePerson!, text: " (explain) ")
        animationCommands.append(textTuple)
        textTuple = (speaker: pmPerson!, text: " (consult) ")
        animationCommands.append(textTuple)
        textTuple = (speaker: mePerson!, text: "Ok")
        animationCommands.append(textTuple)
        waitDuration = 2
        animationCommands.append(waitDuration)
        textTuple = (speaker: pmPerson!, text: "By the way, next time don't walk behind the department head")
        animationCommands.append(textTuple)
        textTuple = (speaker: pmPerson!, text: "Walk the other way around")
        animationCommands.append(textTuple)

        
        translateTuple = (personView: ghostMePerson!, translation: NSPoint(x: -100, y: 0))
        animationCommands.append(translateTuple)
        rotateToAngleTuple = (personView: ghostMePerson!, rotation: facingDownAngle)
        animationCommands.append(rotateToAngleTuple)
        translateTuple = (personView: ghostMePerson!, translation: NSPoint(x: 0, y: -250))
        animationCommands.append(translateTuple)
        rotateToAngleTuple = (personView: ghostMePerson!, rotation: facingRightAngle)
        animationCommands.append(rotateToAngleTuple)
        translateTuple = (personView: ghostMePerson!, translation: NSPoint(x: 400, y: 0))
        animationCommands.append(translateTuple)
        rotateToAngleTuple = (personView: ghostMePerson!, rotation: facingUpAngle)
        animationCommands.append(rotateToAngleTuple)
        translateTuple = (personView: ghostMePerson!, translation: NSPoint(x: 0, y: 375))
        animationCommands.append(translateTuple)
        rotateToPersonTuple = (turningPersonView: ghostMePerson!, targetPersonView: pmPerson!)
        animationCommands.append(rotateToPersonTuple)
        waitDuration = 2
        animationCommands.append(waitDuration)

        textTuple = (speaker: pmPerson!, text: "Like that")
        animationCommands.append(textTuple)

        rotateToPersonTuple = (turningPersonView: mePerson!, targetPersonView: deptHeadPerson!)
        animationCommands.append(rotateToPersonTuple)
        waitDuration = 2
        animationCommands.append(waitDuration)
        rotateToPersonTuple = (turningPersonView: mePerson!, targetPersonView: pmPerson!)
        animationCommands.append(rotateToPersonTuple)
        waitDuration = 2
        animationCommands.append(waitDuration)
        rotateToPersonTuple = (turningPersonView: mePerson!, targetPersonView: deptHeadPerson!)
        animationCommands.append(rotateToPersonTuple)
        waitDuration = 2
        animationCommands.append(waitDuration)
        textTuple = (speaker: deptHeadPerson!, text: "?")
        animationCommands.append(textTuple)
        rotateToPersonTuple = (turningPersonView: mePerson!, targetPersonView: pmPerson!)
        animationCommands.append(rotateToPersonTuple)
        textTuple = (speaker: mePerson!, text: "...")
        animationCommands.append(textTuple)
        textTuple = (speaker: mePerson!, text: "...Ok")
        animationCommands.append(textTuple)
    }

    func executeAnimationCommands() {
        if (animationCommands.count == 0) {
            return
        }

        let superself = self

        let animationCommand = animationCommands.removeFirst()
        
        if let waitCommand = animationCommand as? Double {
            Timer.scheduledTimer(withTimeInterval: waitCommand, repeats: false, block: { (timer) in
                self.executeAnimationCommands()
            })
        }
        
        if let textCommand = animationCommand as? (speaker: PersonView, text: String) {
            let textView = CustomTextView(speaker: textCommand.speaker, text: textCommand.text)
            view.addSubview(textView)
            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false, block: { (timer) in
                textView.removeFromSuperview()
                self.executeAnimationCommands()
            })
            return
        }

        if let rotateCommand = animationCommand as? (turningPersonView: PersonView, targetPersonView: PersonView) {
            Swift.print("rotating to person")
            if (rotateCommand.turningPersonView.isEqual(ghostMePerson)) {
                ghostMePerson?.alphaValue = 0.5
            }
            else {
                ghostMePerson?.alphaValue = 0
            }
            
            rotateCommand.turningPersonView.turnTo(otherPerson: rotateCommand.targetPersonView, completionHandler: { 
                self.executeAnimationCommands()
            })
            return
        }

        if let translateCommand = animationCommand as? (personView: PersonView, translation: NSPoint) {
            Swift.print("moving")
            if (translateCommand.personView.isEqual(ghostMePerson)) {
                ghostMePerson?.alphaValue = 0.5
            }
            else {
                ghostMePerson?.alphaValue = 0
            }

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
            if (rotateCommand.personView.isEqual(ghostMePerson)) {
                ghostMePerson?.alphaValue = 0.5
            }
            else {
                ghostMePerson?.alphaValue = 0
            }

            
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
