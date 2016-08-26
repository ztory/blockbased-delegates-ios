//
//  ViewController.swift
//  blockbased-delegates
//
//  Created by ChristianRonningen on 08/24/2016.
//  Copyright (c) 2016 ChristianRonningen. All rights reserved.
//

import UIKit

class ScrollViewViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
