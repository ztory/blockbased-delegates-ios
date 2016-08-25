//
//  WebViewBlockDelegateTests.swift
//  blockbased-delegates
//
//  Created by Christian Rönningen on 25/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

import UIKit

@testable import blockbased_delegates

class WebViewBlockDelegateTests: XCTestCase {

    var sut: BlockWebViewDelegate!
    var webView: UIWebView!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        sut = BlockWebViewDelegate()
        webView = UIWebView()
        webView.blockDelegate = sut
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_delegate_has_been_set() {
        if let delegate = webView.delegate as? BlockWebViewDelegate {
            XCTAssertEqual(delegate, sut)
        } else {
            XCTFail("Wrong or no delegate set")
        }
    }

    func test_webview_did_start_load() {
        var callbackCalled = false

        sut.webViewDidStartLoadBlock = { (webView) in
            XCTAssertEqual(webView, self.webView)

            callbackCalled = true
        }

        webView.delegate!.webViewDidStartLoad!(webView)

        XCTAssertTrue(callbackCalled)
    }

    func test_webview_did_finish_load() {
        var callbackCalled = false

        sut.webViewDidFinishLoadBlock = { (webView) in
            XCTAssertEqual(webView, self.webView)

            callbackCalled = true
        }

        webView.delegate!.webViewDidFinishLoad!(webView)

        XCTAssertTrue(callbackCalled)
    }

    func test_webview_did_fail_load_with_error() {
        var callbackCalled = false

        let inputError = NSError(domain: "", code: 1, userInfo: nil)

        sut.webViewDidFailLoadWithErrorBlock = { (webView, error) in
            XCTAssertEqual(webView, self.webView)
            XCTAssertEqual(error, inputError)

            callbackCalled = true
        }

        webView.delegate!.webView!(webView, didFailLoadWithError: inputError)

        XCTAssertTrue(callbackCalled)
    }

    func test_webview_should_start_load_with_request() {
        var callbackCalled = false

        let inputRequest = NSURLRequest()
        let inputNavigationType = UIWebViewNavigationType.Reload
        let defaultValue = webView.delegate!.webView!(webView, shouldStartLoadWithRequest: inputRequest, navigationType: inputNavigationType)
        XCTAssertTrue(defaultValue)
        
        sut.webViewShouldStartLoadWithRequestBlock = { (webView, request, navigationType) in
            XCTAssertEqual(webView, self.webView)
            XCTAssertEqual(request, inputRequest)
            XCTAssertEqual(navigationType, inputNavigationType)

            callbackCalled = true
            
            return false
        }

        let blockValue = webView.delegate!.webView!(webView, shouldStartLoadWithRequest: inputRequest, navigationType: inputNavigationType)
        XCTAssertFalse(blockValue)
        
        XCTAssertTrue(callbackCalled)
    }


}
