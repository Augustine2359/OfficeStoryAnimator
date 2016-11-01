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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = TableView(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
        view.addSubview(tableView)
    }
}
