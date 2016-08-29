//
//  TextFieldViewController.swift
//  blockbased-delegates
//
//  Created by Christian Rönningen on 29/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

import blockbased_delegates_ios

class TextFieldViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.blockDelegate = BlockTextFieldDelegate(textFieldShouldBeginEditingBlock: { _ in
            NSLog("Inside delegate block")
            return true
        })

    }
}
