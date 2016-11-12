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

    let standardPersonWidth: Double = 110
    let standardPersonHeight: Double = 110

    let facingUpAngle:CGFloat = 90
    let facingLeftAngle:CGFloat = 180
    let facingDownAngle:CGFloat = -90
    let facingRightAngle:CGFloat = 0
    
    var mePerson: PersonView?
    var deptHeadPerson: PersonView?
    var pmPerson: PersonView?
    var ghostMePerson: PersonView?
    
    var animationCommands: [Any] = []
    
    var jankenPeople: [PersonView] = []

    var scrollView: NSScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView = NSScrollView(frame: NSRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        scrollView!.autoresizingMask = [.viewHeightSizable, .viewWidthSizable]
        scrollView!.hasHorizontalScroller = true
        view.addSubview(scrollView!)

        randomDecisionViewsAndCommands()

//        officeStoryViewsAndCommands()
    }

    func randomDecisionViewsAndCommands() {
        jankenPersonViews(fromX: 400, y: 10)

        let subView = NSView(frame: NSRect(x: 0, y: 0, width: 1500, height: 1500))

        for personView in jankenPeople {
            subView.addSubview(personView)
        }

        scrollView?.documentView = subView

        ghostMePerson = PersonView(frame: NSRect(x: 50, y: 310, width: 5000, height: 500), direction: facingRightAngle, isVIP: true)
        ghostMePerson?.alphaValue = 0
        subView.addSubview(ghostMePerson!)

        let waitDuration:Double = 10
        animationCommands.append(waitDuration)

        var textTuple = (speaker: jankenPeople[2], text: "Ok guys, we need to decide who has to stay back today.")
        animationCommands.append(textTuple)
        textTuple = (speaker: jankenPeople[6], text: "Let's decide using janken.")
        animationCommands.append(textTuple)

        textTuple = (speaker: ghostMePerson!, text: "JAN KEN PON")
        animationCommands.append(textTuple)

        var jankenTuple = (player: mePerson!, symbol: 0)
        animationCommands.append(jankenTuple)
        textTuple = (speaker: jankenPeople[3], text: "Let's try again.")
        animationCommands.append(textTuple)

        textTuple = (speaker: ghostMePerson!, text: "JAN KEN PON")
        animationCommands.append(textTuple)

        jankenTuple = (player: mePerson!, symbol: 1)
        animationCommands.append(jankenTuple)
        textTuple = (speaker: jankenPeople[7], text: "Still can't decide.")
        animationCommands.append(textTuple)

        textTuple = (speaker: ghostMePerson!, text: "JAN KEN PON")
        animationCommands.append(textTuple)

        jankenTuple = (player: mePerson!, symbol: 2)
        animationCommands.append(jankenTuple)

        textTuple = (speaker: mePerson!, text: "Oh I have a suggestion. We have another way to do it in my country.")
        animationCommands.append(textTuple)

        textTuple = (speaker: ghostMePerson!, text: "(2 minutes later...)")
        animationCommands.append(textTuple)

        textTuple = (speaker: mePerson!, text: "Everyone got it?")
        animationCommands.append(textTuple)

        textTuple = (speaker: jankenPeople[1], text: "Yup.")
        animationCommands.append(textTuple)

        textTuple = (speaker: jankenPeople[5], text: "Yup.")
        animationCommands.append(textTuple)

        textTuple = (speaker: ghostMePerson!, text: "O YA PE YA SONG!")
        animationCommands.append(textTuple)

        jankenTuple = (player: mePerson!, symbol: -1)
        animationCommands.append(jankenTuple)

        textTuple = (speaker: ghostMePerson!, text: "O YA PE YA SONG!")
        animationCommands.append(textTuple)

        jankenTuple = (player: mePerson!, symbol: -2)
        animationCommands.append(jankenTuple)

        animationCommands.append("all turn")
    }

    func officeStoryViewsAndCommands() {
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
        
        scrollView!.documentView = subView
        
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
        
        if let command = animationCommand as? String {
            if (command == "all turn") {
                for personView in jankenPeople {
                    if (personView.isEqual(mePerson!)) {
                        continue
                    }
                    personView.showJanken(symbol: .None)
                    personView.turnTo(otherPerson: mePerson!, completionHandler: { 

                    })
                }
            }
        }

        if let jankenCommand = animationCommand as? (player: PersonView, symbol: Int) {

            switch jankenCommand.symbol {
            case -1:
                for personView in jankenPeople {
                    personView.showJanken(symbol: .PalmUp)
                }
            case -2:
                for personView in jankenPeople {
                    personView.showJanken(symbol: .PalmUp)
                }
                mePerson!.showJanken(symbol: .Paper)
                Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (timer) in
                    self.executeAnimationCommands()
                })
                return
            default:
                var symbols: [HandSymbol] = [.Paper, .Scissors, .Stone]

                var symbolIndex = jankenCommand.symbol

                for personView in jankenPeople {
                    personView.showJanken(symbol: symbols[symbolIndex%3])
                    symbolIndex += 1
                }
            }

            Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (timer) in
                for personView in self.jankenPeople {
                    personView.showJanken(symbol: .None)
                }
                self.executeAnimationCommands()
            })
        }

        if let waitCommand = animationCommand as? Double {
            Timer.scheduledTimer(withTimeInterval: waitCommand, repeats: false, block: { (timer) in
                self.executeAnimationCommands()
            })
        }
        
        if let textCommand = animationCommand as? (speaker: PersonView, text: String) {
            if textCommand.speaker.isEqual(ghostMePerson!) {
                let textView = CustomTextView(shouter: textCommand.speaker, text: textCommand.text)
                view.addSubview(textView)
                Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false, block: { (timer) in
                    textView.removeFromSuperview()
                    self.executeAnimationCommands()
                })
                
                return
            }
            
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

    func jankenPersonViews(fromX x:Double, y:Double) {
        var personViewRect = NSRect(x: x, y: y, width: standardPersonWidth, height: standardPersonHeight)
        mePerson = PersonView(frame: personViewRect, direction: facingUpAngle, isVIP: true)
        jankenPeople.append(mePerson!)

        personViewRect.origin.x += CGFloat(2 * standardPersonWidth)
        jankenPeople.append(PersonView(frame: personViewRect, direction: facingUpAngle, isVIP: false))

        personViewRect.origin.x += CGFloat(2 * standardPersonWidth)
        personViewRect.origin.y += CGFloat(2 * standardPersonWidth)
        jankenPeople.append(PersonView(frame: personViewRect, direction: facingLeftAngle, isVIP: false))

        personViewRect.origin.y += CGFloat(2 * standardPersonWidth)
        jankenPeople.append(PersonView(frame: personViewRect, direction: facingLeftAngle, isVIP: false))

        personViewRect.origin.x -= CGFloat(2 * standardPersonWidth)
        personViewRect.origin.y += CGFloat(2 * standardPersonWidth)
        jankenPeople.append(PersonView(frame: personViewRect, direction: facingDownAngle, isVIP: false))

        personViewRect.origin.x -= CGFloat(2 * standardPersonWidth)
        jankenPeople.append(PersonView(frame: personViewRect, direction: facingDownAngle, isVIP: false))

        personViewRect.origin.x -= CGFloat(2 * standardPersonWidth)
        personViewRect.origin.y -= CGFloat(2 * standardPersonWidth)
        jankenPeople.append(PersonView(frame: personViewRect, direction: facingRightAngle, isVIP: false))

        personViewRect.origin.y -= CGFloat(2 * standardPersonWidth)
        jankenPeople.append(PersonView(frame: personViewRect, direction: facingRightAngle, isVIP: false))
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
