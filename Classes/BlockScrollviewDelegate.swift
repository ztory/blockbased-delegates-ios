//
//  BlockScrollviewDelegate.swift
//  Pods
//
//  Created by Christian Rönningen on 24/08/16.
//
//

import UIKit
import ObjectiveC

typealias BlockScrollViewDelegateDidScroll = (scrollView: UIScrollView) -> Void
typealias BlockScrollViewDelegateDidZoom = (scrollView: UIScrollView) -> Void
typealias BlockScrollViewDelegateViewForZoom = (scrollView: UIScrollView) -> UIView?
typealias BlockScrollViewDelegateWillBeginDragging = (scrollView: UIScrollView) -> Void
typealias BlockScrollViewDidEndDecelerating = (scrollView: UIScrollView) -> Void
typealias BlockScrollViewWillBeginDecelerating = (scrollView: UIScrollView) -> Void
typealias BlockScrollViewDidEndDragging = (scrollView: UIScrollView, decelerate: Bool) -> Void
typealias BlockScrollViewWillEndDragging = (scrollView: UIScrollView, velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) -> Void
typealias BlockScrollViewWillBeginZooming = (scrollView: UIScrollView, view: UIView?) -> Void
typealias BlockScrollDidEndZooming = (scrollView: UIScrollView, view: UIView?, scale: CGFloat) -> Void
typealias BlockScrollViewDidEndScrollingAnimation = (scrollView: UIScrollView) -> Void
typealias BlockScrollViewDidScrollToTop = (scrollView: UIScrollView) -> Void
typealias BlockScrollViewShouldScrollToTop = (scrollView: UIScrollView) -> Bool

class BlockScrollviewDelegate: NSObject, UIScrollViewDelegate {
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

    init(scrollViewDidScrollBlock: BlockScrollViewDelegateDidScroll? = nil,
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


    func scrollViewDidScroll(scrollView: UIScrollView) {
        guard let block = scrollViewDidScrollBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    func scrollViewDidZoom(scrollView: UIScrollView) {
        guard let block = scrollViewDidZoomBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        guard let block = scrollViewViewForZoomBlock else {
            return nil
        }

        return block(scrollView: scrollView)
    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        guard let block = scrollViewWillBeginDraggingBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        guard let block = scrollViewDidEndDeceleratingBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        guard let block = scrollViewWillBeginDeceleratingBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard let block = scrollViewDidEndDraggingBlock else {
            return
        }

        block(scrollView: scrollView, decelerate: decelerate)
    }

    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let block = scrollViewWillEndDraggingBlock else {
            return
        }

        block(scrollView: scrollView, velocity: velocity, targetContentOffset: targetContentOffset)
    }

    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?) {
        guard let block = scrollViewWillBeginZoomingBlock else {
            return
        }

        block(scrollView: scrollView, view: view)
    }

    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        guard let block = scrollViewBlockScrollDidEndZoomingBlock else {
            return
        }

        block(scrollView: scrollView, view: view, scale: scale)
    }

    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        guard let block = scrollViewDidEndScrollingAnimationBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    func scrollViewDidScrollToTop(scrollView: UIScrollView) {
        guard let block = scrollViewDidScrollToTopBlock else {
            return
        }

        block(scrollView: scrollView)
    }

    func scrollViewShouldScrollToTop(scrollView: UIScrollView) -> Bool {
        guard let block = scrollViewShouldScrollToTopBlock else {
            return true
        }

        return block(scrollView: scrollView)
    }
}

extension UIScrollView {
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
