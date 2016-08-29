//
//  GestureViewController.swift
//  blockbased-delegates
//
//  Created by Christian Rönningen on 29/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

import blockbased_delegates_ios

class GestureViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UITapGestureRecognizer()
        gesture.blockDelegate = BlockGestureRecognizerDelegate(gestureRecognizerShouldBeginBlock: { _ in
            NSLog("Inside block delegate")
            return true
        })
        view.addGestureRecognizer(gesture)
    }
}
