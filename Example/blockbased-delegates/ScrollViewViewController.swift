//
//  ViewController.swift
//  blockbased-delegates
//
//  Created by ChristianRonningen on 08/24/2016.
//  Copyright (c) 2016 ChristianRonningen. All rights reserved.
//

import UIKit

import blockbased_delegates_ios

class ScrollViewViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.contentSize = CGSize(width: 2000, height: 2000)
        scrollView.blockDelegate = BlockScrollviewDelegate(scrollViewDidScrollBlock: { _ in
            NSLog("We scrolled")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
