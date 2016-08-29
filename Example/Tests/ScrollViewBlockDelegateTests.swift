//
//  ScrollViewBlockDelegateTests.swift
//  blockbased-delegates
//
//  Created by Christian Rönningen on 24/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

@testable import blockbased_delegates_ios

class ScrollViewBlockDelegateTests: XCTestCase {

    var sut: BlockScrollviewDelegate!
    var scrollView: UIScrollView!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        sut = BlockScrollviewDelegate()
        scrollView = UIScrollView()
        scrollView.delegate = sut
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_blockdelegate_should_be_nil() {
        var scroll: UIScrollView? = UIScrollView()
        var blockD: BlockScrollviewDelegate? = BlockScrollviewDelegate()
        scroll!.blockDelegate = blockD
        
        weak var weakBlockDelegate = blockD
        
        XCTAssertNotNil(weakBlockDelegate)
        
        blockD = nil
        scroll!.blockDelegate = nil
        scroll = nil
        
        XCTAssertNil(weakBlockDelegate)
    }
    
    func test_delegate_has_been_set() {
        if let delegate = scrollView.delegate as? BlockScrollviewDelegate {
            XCTAssertEqual(delegate, sut)
        } else {
            XCTFail("Wrong or no delegate set")
        }
    }

    func test_scrollview_did_scroll() {
        var callbackCalled = false
        sut.scrollViewDidScrollBlock = { (scrollView) in
            XCTAssertEqual(scrollView, self.scrollView)
            callbackCalled = true
        }

        scrollView.delegate!.scrollViewDidScroll!(scrollView)

        XCTAssertTrue(callbackCalled)
    }

    func test_scrollview_did_zoom() {
        var callbackCalled = false

        sut.scrollViewDidZoomBlock = { (scrollView) in
            XCTAssertEqual(scrollView, self.scrollView)
            callbackCalled = true
        }

        scrollView.delegate!.scrollViewDidZoom!(scrollView)

        XCTAssertTrue(callbackCalled)
    }

    func test_scrollview_view_for_zoom() {
        var callbackCalled = false

        let defaultZoomView = scrollView.delegate!.viewForZoomingInScrollView!(scrollView)
        XCTAssertNil(defaultZoomView)

        let viewToZoom = UIView()
        sut.scrollViewViewForZoomBlock = { (scrollView) in
            XCTAssertEqual(scrollView, self.scrollView)
            callbackCalled = true
            return viewToZoom
        }

        let zoomView = scrollView.delegate!.viewForZoomingInScrollView!(scrollView)

        XCTAssertTrue(callbackCalled)
        XCTAssertEqual(viewToZoom, zoomView)
    }

    func test_scrollview_will_begin_dragging() {
        var callbackCalled = false

        sut.scrollViewWillBeginDraggingBlock = { (scrollView) in
            XCTAssertEqual(scrollView, self.scrollView)
            callbackCalled = true
        }

        scrollView.delegate!.scrollViewWillBeginDragging!(scrollView)

        XCTAssertTrue(callbackCalled)
    }

    func test_scrollview_did_end_decelerating() {
        var callbackCalled = false

        sut.scrollViewDidEndDeceleratingBlock = { (scrollView) in
            XCTAssertEqual(scrollView, self.scrollView)
            callbackCalled = true
        }

        scrollView.delegate!.scrollViewDidEndDecelerating!(scrollView)

        XCTAssertTrue(callbackCalled)
    }

    func test_scrollview_will_begin_decelerating() {
        var callbackCalled = false

        sut.scrollViewWillBeginDeceleratingBlock = { (scrollView) in
            XCTAssertEqual(scrollView, self.scrollView)
            callbackCalled = true
        }

        scrollView.delegate!.scrollViewWillBeginDecelerating!(scrollView)

        XCTAssertTrue(callbackCalled)
    }

    func test_scrollview_did_end_dragging() {
        var callbackCalled = false
        let willDecelerate = true

        sut.scrollViewDidEndDraggingBlock = { (scrollView, decelerate) in
            XCTAssertEqual(scrollView, self.scrollView)
            XCTAssertEqual(willDecelerate, decelerate)
            callbackCalled = true
        }

        scrollView.delegate!.scrollViewDidEndDragging!(scrollView, willDecelerate: willDecelerate)

        XCTAssertTrue(callbackCalled)
    }

    func test_scrollview_will_end_dragging() {
        var callbackCalled = false
        let inputVelocity = CGPoint(x: 10, y: 20)
        let inputTargetContentOffset: UnsafeMutablePointer<CGPoint> = nil

        sut.scrollViewWillEndDraggingBlock = { (scrollView: UIScrollView, velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) in
            XCTAssertEqual(scrollView, self.scrollView)
            XCTAssertEqual(velocity, inputVelocity)
            XCTAssertEqual(targetContentOffset, inputTargetContentOffset)
            callbackCalled = true
        }

        scrollView.delegate!.scrollViewWillEndDragging!(scrollView, withVelocity: inputVelocity, targetContentOffset: inputTargetContentOffset)

        XCTAssertTrue(callbackCalled)
    }

    func test_scrollview_will_begin_zooming() {
        var callbackCalled = false

        let inputView = UIView()

        sut.scrollViewWillBeginZoomingBlock = { (scrollView, view) in
            XCTAssertEqual(scrollView, self.scrollView)
            XCTAssertEqual(view, inputView)
            callbackCalled = true
        }

        scrollView.delegate!.scrollViewWillBeginZooming!(scrollView, withView: inputView)

        XCTAssertTrue(callbackCalled)
    }

    func test_scrollview_did_end_zooming() {
        var callbackCalled = false

        let inputView = UIView()
        let inputScale: CGFloat = 1.0

        sut.scrollViewBlockScrollDidEndZoomingBlock = { (scrollView, view, scale) in
            XCTAssertEqual(scrollView, self.scrollView)
            XCTAssertEqual(view, inputView)
            XCTAssertEqual(scale, inputScale)
            callbackCalled = true
        }

        scrollView.delegate!.scrollViewDidEndZooming!(scrollView, withView: inputView, atScale: inputScale)

        XCTAssertTrue(callbackCalled)
    }

    func test_scrollview_did_end_scrolling_animation() {
        var callbackCalled = false

        sut.scrollViewDidEndScrollingAnimationBlock = { (scrollView) in
            XCTAssertEqual(scrollView, self.scrollView)

            callbackCalled = true
        }

        scrollView.delegate!.scrollViewDidEndScrollingAnimation!(scrollView)

        XCTAssertTrue(callbackCalled)
    }

    func test_scrollview_did_scroll_to_top() {
        var callbackCalled = false

        let defaultValue = scrollView.delegate!.scrollViewShouldScrollToTop!(scrollView)
        XCTAssertTrue(defaultValue)

        sut.scrollViewShouldScrollToTopBlock = { (scrollView) in
            XCTAssertEqual(scrollView, self.scrollView)

            callbackCalled = true

            return false
        }

        let blockValue = scrollView.delegate!.scrollViewShouldScrollToTop!(scrollView)
        XCTAssertFalse(blockValue)
        XCTAssertTrue(callbackCalled)
    }
}
