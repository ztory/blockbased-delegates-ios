
import UIKit



public typealias BlockGestureDelegateShouldBeginBlock = ( gestureRecognizer: UIGestureRecognizer ) -> Bool
public typealias BlockGestureDelegateShouldRecieveTouchBlock = ( gestureRecognizer: UIGestureRecognizer, touch: UITouch ) -> Bool
public typealias BlockGestureDelegateShouldRequireFailureOfGesture = ( gestureRecognizer: UIGestureRecognizer, otherGestureRecognizer: UIGestureRecognizer ) -> Bool
public typealias BlockGestureDelegateShouldBeRequireToFailureByGesture = ( gestureRecognizer: UIGestureRecognizer, otherGestureRecognizer: UIGestureRecognizer ) -> Bool
public typealias BlockGestureDelegateShouldRecognizeSimultaneouslyBlock = ( gestureRecognizer: UIGestureRecognizer, otherGestureRecognizer: UIGestureRecognizer ) -> Bool
//@available(iOS 9.0, *)
//typealias BlockGestureDelegateShouldRecievePressBlock = ( gestureRecognizer: UIGestureRecognizer, press: UIPress ) -> Bool


/**
 Convert UIGestureRecognizerDelegate to its block based counterparts

 Will return default values if no block is present
 */
public class BlockGestureRecognizerDelegate: NSObject, UIGestureRecognizerDelegate {

    var gestureRecognizerShouldBeginBlock: BlockGestureDelegateShouldBeginBlock?
    var gestureRecognizerShouldRecieveTouchBlock: BlockGestureDelegateShouldRecieveTouchBlock?
    var gestureRecognizerShouldRequireFailureOfGestureBlock: BlockGestureDelegateShouldRequireFailureOfGesture?
    var gestureRecognizerShouldBeRequiredToFailBlock: BlockGestureDelegateShouldBeRequireToFailureByGesture?
    var gestureRecognizerShouldRecognizeSimultaneouslyBlock: BlockGestureDelegateShouldBeRequireToFailureByGesture?
//    @available(iOS 9.0, *)
//    var gestureRecognizerShouldRecievePressBlock: BlockGestureDelegateShouldRecievePressBlock?

//    @available(iOS 9.0,*)
//    init(gestureRecognizerShouldBeginBlock: BlockGestureDelegateShouldBeginBlock? = nil,
//         gestureRecognizerShouldRecievePressBlock: BlockGestureDelegateShouldRecievePressBlock? = nil,
//         gestureRecognizerShouldRecieveTouchBlock: BlockGestureDelegateShouldRecieveTouchBlock? = nil,
//         gestureRecognizerShouldRequireFailureOfGestureBlock: BlockGestureDelegateShouldRequireFailureOfGesture? = nil,
//         gestureRecognizerShouldBeRequiredToFailBlock: BlockGestureDelegateShouldBeRequireToFailureByGesture? = nil,
//         gestureRecognizerShouldRecognizeSimultaneouslyBlock: BlockGestureDelegateShouldBeRequireToFailureByGesture? = nil) {
//        super.init()
//
//        self.gestureRecognizerShouldBeginBlock = gestureRecognizerShouldBeginBlock
//        self.gestureRecognizerShouldRecievePressBlock = gestureRecognizerShouldRecievePressBlock
//        self.gestureRecognizerShouldRecieveTouchBlock = gestureRecognizerShouldRecieveTouchBlock
//        self.gestureRecognizerShouldRequireFailureOfGestureBlock = gestureRecognizerShouldRequireFailureOfGestureBlock
//        self.gestureRecognizerShouldBeRequiredToFailBlock = gestureRecognizerShouldBeRequiredToFailBlock
//        self.gestureRecognizerShouldRecognizeSimultaneouslyBlock = gestureRecognizerShouldRecognizeSimultaneouslyBlock
//    }

    public init(gestureRecognizerShouldBeginBlock: BlockGestureDelegateShouldBeginBlock? = nil,
                gestureRecognizerShouldRecieveTouchBlock: BlockGestureDelegateShouldRecieveTouchBlock? = nil,
                gestureRecognizerShouldRequireFailureOfGestureBlock: BlockGestureDelegateShouldRequireFailureOfGesture? = nil,
                gestureRecognizerShouldBeRequiredToFailBlock: BlockGestureDelegateShouldBeRequireToFailureByGesture? = nil,
                gestureRecognizerShouldRecognizeSimultaneouslyBlock: BlockGestureDelegateShouldBeRequireToFailureByGesture? = nil) {
        super.init()

        self.gestureRecognizerShouldBeginBlock = gestureRecognizerShouldBeginBlock
        self.gestureRecognizerShouldRecieveTouchBlock = gestureRecognizerShouldRecieveTouchBlock
        self.gestureRecognizerShouldRequireFailureOfGestureBlock = gestureRecognizerShouldRequireFailureOfGestureBlock
        self.gestureRecognizerShouldBeRequiredToFailBlock = gestureRecognizerShouldBeRequiredToFailBlock
        self.gestureRecognizerShouldRecognizeSimultaneouslyBlock = gestureRecognizerShouldRecognizeSimultaneouslyBlock
    }

    public func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let block = gestureRecognizerShouldBeginBlock else {
            return true
        }

        return block(gestureRecognizer: gestureRecognizer)
    }

//    @available(iOS 9.0, *)
//    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceivePress press: UIPress) -> Bool {
//        if gestureRecognizerShouldRecievePressBlock != nil {
//            return gestureRecognizerShouldRecievePressBlock!(gestureRecognizer: gestureRecognizer, press: press)
//        }
//
//        return true
//    }

    public func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        guard let block = gestureRecognizerShouldRecieveTouchBlock else {
            return true
        }

        return block(gestureRecognizer: gestureRecognizer, touch: touch)
    }

    public func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOfGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let block = gestureRecognizerShouldRequireFailureOfGestureBlock else {
            return false
        }

        return block(gestureRecognizer: gestureRecognizer, otherGestureRecognizer: otherGestureRecognizer)
    }

    public func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailByGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let block = gestureRecognizerShouldBeRequiredToFailBlock else {
            return false
        }

        return block(gestureRecognizer: gestureRecognizer, otherGestureRecognizer: otherGestureRecognizer)
    }

    public func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let block = gestureRecognizerShouldRecognizeSimultaneouslyBlock else {
            return false
        }

        return block(gestureRecognizer: gestureRecognizer, otherGestureRecognizer: otherGestureRecognizer)
    }
}

public extension UIGestureRecognizer {

    private struct AssociatedKeys {
        static var BlockDelegateName = "zm_blockDelegate"
    }

    /**
     Convenience parameter to hold strong refernce to blockdelegate
     */
    var blockDelegate: BlockGestureRecognizerDelegate? {
        set {
            delegate = newValue

            objc_setAssociatedObject(self, &AssociatedKeys.BlockDelegateName, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.BlockDelegateName) as? BlockGestureRecognizerDelegate
        }
    }
}
