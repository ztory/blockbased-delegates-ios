//
//  WebViewViewController.swift
//  blockbased-delegates
//
//  Created by Christian Rönningen on 29/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

import blockbased_delegates_ios

class WebViewViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let delegate = BlockWebViewDelegate(webViewDidStartLoadBlock: { _ in
            NSLog("Inside block delegate")
        })
        webView.blockDelegate = delegate

        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.google.com")!))
    }
}
