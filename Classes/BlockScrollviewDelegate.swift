//
//  BlockScrollviewDelegate.swift
//  Pods
//
//  Created by Christian Rönningen on 24/08/16.
//
//

import UIKit
import ObjectiveC

public typealias BlockScrollViewDelegateDidScroll = (scrollView: UIScrollView) -> Void
public typealias BlockScrollViewDelegateDidZoom = (scrollView: UIScrollView) -> Void
public typealias BlockScrollViewDelegateViewForZoom = (scrollView: UIScrollView) -> UIView?
public typealias BlockScrollViewDelegateWillBeginDragging = (scrollView: UIScrollView) -> Void
public typealias BlockScrollViewDidEndDecelerating = (scrollView: UIScrollView) -> Void
public typealias BlockScrollViewWillBeginDecelerating = (scrollView: UIScrollView) -> Void
public typealias BlockScrollViewDidEndDragging = (scrollView: UIScrollView, decelerate: Bool) -> Void
public typealias BlockScrollViewWillEndDragging = (scrollView: UIScrollView, velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) -> Void
public typealias BlockScrollViewWillBeginZooming = (scrollView: UIScrollView, view: UIView?) -> Void
public typealias BlockScrollDidEndZooming = (scrollView: UIScrollView, view: UIView?, scale: CGFloat) -> Void
public typealias BlockScrollViewDidEndScrollingAnimation = (scrollView: UIScrollView) -> Void
public typealias BlockScrollViewDidScrollToTop = (scrollView: UIScrollView) -> Void
public typealias BlockScrollViewShouldScrollToTop = (scrollView: UIScrollView) -> Bool

public class BlockScrollviewDelegate: NSObject, UIScrollViewDelegate {
    var scrollViewDidScrollBlock: BlockScrollViewDelegateDidScroll?
    var scrollViewDidZoomBlock: BlockScrollViewDelegateDidZoom?
    var scrollViewViewForZoomBlock: BlockScrollViewDelegateViewForZoom?
    var scrollViewWillBeginDraggingBlock: BlockScrollViewDelegateWillBeginDragging?
    var scrollViewDidEndDeceleratingBlock: BlockScrollViewDidEndDecelerating?
    var scrollViewWillBeginDeceleratingBlock: BlockScrollViewWillBeginDecelerating?
    var scrollViewDidEndDraggingBlock: BlockScrollViewDidEndDragging?
    var scrollViewWillEndDraggingBlock: BlockScrollViewWillEndDragging?
    var scrollViewWillBeginZoomingBlock: BlockScrollViewWillBeginZooming?
    var scrollViewBlockScrollDidEndZoomingBlock: BlockScrollDidEndZooming?
    var scrollViewDidEndScrollingAnimationBlock: BlockScrollViewDidEndScrollingAnimation?
    var scrollViewDidScrollToTopBlock: BlockScrollViewDidScrollToTop?
    var scrollViewShouldScrollToTopBlock: BlockScrollViewShouldScrollToTop?

    public init(scrollViewDidScrollBlock: BlockScrollViewDelegateDidScroll? = nil,
                scrollViewDidZoomBlock: BlockScrollViewDelegateDidZoom? = nil,
                scrollViewViewForZoomBlock: BlockScrollViewDelegateViewForZoom? = nil,
                scrollViewWillBeginDraggingBlock: BlockScrollViewDelegateWillBeginDragging? = nil,
                scrollViewDidEndDeceleratingBlock: BlockScrollViewDidEndDecelerating? = nil,
                scrollViewWillBeginDeceleratingBlock: BlockScrollViewWillBeginDecelerating? = nil,
                scrollViewDidEndDraggingBlock: BlockScrollViewDidEndDragging? = nil,
                scrollViewWillEndDraggingBlock: BlockScrollViewWillEndDragging? = nil,
                scrollViewWillBeginZoomingBlock: BlockScrollViewWillBeginZooming? = nil,
                scrollViewBlockScrollDidEndZoomingBlock: BlockScrollDidEndZooming? = nil,
                scrollViewDidEndScrollingAnimationBlock: BlockScrollViewDidEndScrollingAnimation? = nil,
                scrollViewDidScrollToTopBlock: BlockScrollViewDidScrollToTop? = nil,
                scrollViewShouldScrollToTopBlock: BlockScrollViewShouldScrollToTop? = nil) {
        super.init()

        self.scrollViewDidScrollBlock = scrollViewDidScrollBlock
        self.scrollViewDidZoomBlock = scrollViewDidZoomBlock
        self.scrollViewViewForZoomBlock = scrollViewViewForZoomBlock
        self.scrollViewWillBeginDraggingBlock = scrollViewWillBeginDraggingBlock
        self.scrollViewDidEndDeceleratingBlock = scrollViewDidEndDeceleratingBlock
        self.scrollViewWillBeginDeceleratingBlock = scrollViewWillBeginDeceleratingBlock
        self.scrollViewDidEndDraggingBlock = scrollViewDidEndDraggingBlock
        self.scrollViewWillEndDraggingBlock = scrollViewWillEndDraggingBlock
        self.scrollViewWillBeginZoomingBlock = scrollViewWillBeginZoomingBlock
        self.scrollViewBlockScrollDidEndZoomingBlock = scrollViewBlockScrollDidEndZoomingBlock
        self.scrollViewDidEndScrollingAnimationBlock = scrollViewDidEndScrollingAnimationBlock
        self.scrollViewDidScrollToTopBlock = scrollViewDidScrollToTopBlock
        self.scrollViewShouldScrollToTopBlock = scrollViewShouldScrollToTopBlock
    }


    public func scrollViewDidScroll(scrollView: UIScrollView) {
        guard let block = scrollViewDidScrollBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    public func scrollViewDidZoom(scrollView: UIScrollView) {
        guard let block = scrollViewDidZoomBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    public func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        guard let block = scrollViewViewForZoomBlock else {
            return nil
        }

        return block(scrollView: scrollView)
    }

    public func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        guard let block = scrollViewWillBeginDraggingBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    public func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        guard let block = scrollViewDidEndDeceleratingBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    public func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        guard let block = scrollViewWillBeginDeceleratingBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    public func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard let block = scrollViewDidEndDraggingBlock else {
            return
        }

        block(scrollView: scrollView, decelerate: decelerate)
    }

    public func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let block = scrollViewWillEndDraggingBlock else {
            return
        }

        block(scrollView: scrollView, velocity: velocity, targetContentOffset: targetContentOffset)
    }

    public func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?) {
        guard let block = scrollViewWillBeginZoomingBlock else {
            return
        }

        block(scrollView: scrollView, view: view)
    }

    public func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        guard let block = scrollViewBlockScrollDidEndZoomingBlock else {
            return
        }

        block(scrollView: scrollView, view: view, scale: scale)
    }

    public func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        guard let block = scrollViewDidEndScrollingAnimationBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    public func scrollViewDidScrollToTop(scrollView: UIScrollView) {
        guard let block = scrollViewDidScrollToTopBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    public func scrollViewShouldScrollToTop(scrollView: UIScrollView) -> Bool {
        guard let block = scrollViewShouldScrollToTopBlock else {
            return true
        }

        return block(scrollView: scrollView)
    }
}

public extension UIScrollView {
    private struct AssociatedKeys {
        static var BlockDelegateName = "zm_blockDelegate"
    }

    /**
     Convenience parameter to hold strong refernce to blockdelegate
     */
    var blockDelegate: BlockScrollviewDelegate? {
        set {
            delegate = newValue
            objc_setAssociatedObject(self, &AssociatedKeys.BlockDelegateName, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.BlockDelegateName) as? BlockScrollviewDelegate
        }
    }
}
