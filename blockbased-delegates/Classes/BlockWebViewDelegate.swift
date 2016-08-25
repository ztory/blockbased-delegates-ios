//
//  BlockWebViewDelegate.swift
//  Pods
//
//  Created by Christian Rönningen on 25/08/16.
//
//

import UIKit
import ObjectiveC

typealias BlockWebViewDidStartLoad = (webView: UIWebView) -> Void
typealias BlockWebViewDidFinishLoad = (webView: UIWebView) -> Void
typealias BlockWebViewDidFailLoadWithError = (webView: UIWebView, error: NSError?) -> Void
typealias BlockWebViewShouldStartLoadWithRequest = (webView: UIWebView, request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool

class BlockWebViewDelegate: NSObject, UIWebViewDelegate {
    var webViewDidStartLoadBlock: BlockWebViewDidStartLoad?
    var webViewDidFinishLoadBlock: BlockWebViewDidFinishLoad?
    var webViewDidFailLoadWithErrorBlock: BlockWebViewDidFailLoadWithError?
    var webViewShouldStartLoadWithRequestBlock: BlockWebViewShouldStartLoadWithRequest?
    
    func webViewDidStartLoad(webView: UIWebView) {
        guard let block = webViewDidStartLoadBlock else {
            return
        }
        
        block(webView: webView)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        guard let block = webViewDidFinishLoadBlock else {
            return
        }
        
        block(webView: webView)
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        guard let block = webViewDidFailLoadWithErrorBlock else {
            return
        }
        
        block(webView: webView, error: error)
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        guard let block = webViewShouldStartLoadWithRequestBlock else {
            return true
        }
        
        return block(webView: webView, request: request, navigationType: navigationType)
    }
}

extension UIWebView {
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
