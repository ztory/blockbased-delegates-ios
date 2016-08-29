//
//  BlockWebViewDelegate.swift
//  Pods
//
//  Created by Christian Rönningen on 25/08/16.
//
//

import UIKit
import ObjectiveC

public typealias BlockWebViewDidStartLoad = (webView: UIWebView) -> Void
public typealias BlockWebViewDidFinishLoad = (webView: UIWebView) -> Void
public typealias BlockWebViewDidFailLoadWithError = (webView: UIWebView, error: NSError?) -> Void
public typealias BlockWebViewShouldStartLoadWithRequest = (webView: UIWebView, request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool

public class BlockWebViewDelegate: NSObject, UIWebViewDelegate {
    var webViewDidStartLoadBlock: BlockWebViewDidStartLoad?
    var webViewDidFinishLoadBlock: BlockWebViewDidFinishLoad?
    var webViewDidFailLoadWithErrorBlock: BlockWebViewDidFailLoadWithError?
    var webViewShouldStartLoadWithRequestBlock: BlockWebViewShouldStartLoadWithRequest?

    public init(webViewDidStartLoadBlock: BlockWebViewDidStartLoad? = nil,
                webViewDidFinishLoadBlock: BlockWebViewDidFinishLoad? = nil,
                webViewDidFailLoadWithErrorBlock: BlockWebViewDidFailLoadWithError? = nil,
                webViewShouldStartLoadWithRequestBlock: BlockWebViewShouldStartLoadWithRequest? = nil) {
        super.init()

        self.webViewDidStartLoadBlock = webViewDidStartLoadBlock
        self.webViewDidFinishLoadBlock = webViewDidFinishLoadBlock
        self.webViewDidFailLoadWithErrorBlock = webViewDidFailLoadWithErrorBlock
        self.webViewShouldStartLoadWithRequestBlock = webViewShouldStartLoadWithRequestBlock
    }

    public func webViewDidStartLoad(webView: UIWebView) {
        guard let block = webViewDidStartLoadBlock else {
            return
        }

        block(webView: webView)
    }

    public func webViewDidFinishLoad(webView: UIWebView) {
        guard let block = webViewDidFinishLoadBlock else {
            return
        }

        block(webView: webView)
    }

    public func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        guard let block = webViewDidFailLoadWithErrorBlock else {
            return
        }

        block(webView: webView, error: error)
    }

    public func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        guard let block = webViewShouldStartLoadWithRequestBlock else {
            return true
        }

        return block(webView: webView, request: request, navigationType: navigationType)
    }
}

public extension UIWebView {
    private struct AssociatedKeys {
        static var BlockDelegateName = "zm_blockDelegate"
    }

    /**
     Convenience parameter to hold strong refernce to blockdelegate
     */
    var blockDelegate: BlockWebViewDelegate? {
        set {
            delegate = newValue
            objc_setAssociatedObject(self, &AssociatedKeys.BlockDelegateName, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.BlockDelegateName) as? BlockWebViewDelegate
        }
    }
}
