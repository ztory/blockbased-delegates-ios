import UIKit
import XCTest

@testable import blockbased_delegates

class GestureRecognizerBlockDelegateTests: XCTestCase {

    var sut: BlockGestureRecognizerDelegate!
    var gesture: UIGestureRecognizer!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        sut = BlockGestureRecognizerDelegate()
        gesture = UIGestureRecognizer()
        gesture.delegate = sut
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_delegate_has_been_set() {
        if let delegate = gesture.delegate as? BlockGestureRecognizerDelegate {
            XCTAssertEqual(delegate, sut)
        } else {
            XCTFail("Wrong or no delegate set")
        }
    }

    func test_should_recieve_touch_callback() {

        let inputTouch = UITouch()

        let defaultValue = gesture.delegate!.gestureRecognizer!(gesture, shouldReceiveTouch: inputTouch)
        XCTAssertTrue(defaultValue)

        var callbackCalled = false
        sut.gestureRecognizerShouldRecieveTouchBlock = { (gesture, touch) in
            XCTAssertEqual(touch, inputTouch)
            callbackCalled = true
            return false
        }

        let blockValue = gesture.delegate!.gestureRecognizer!(gesture, shouldReceiveTouch: inputTouch)
        XCTAssertFalse(blockValue)
        XCTAssertTrue(callbackCalled)
    }

    func test_should_should_be_required_to_fail_callback() {
        let defaultValue = gesture.delegate!.gestureRecognizer!(gesture, shouldBeRequiredToFailByGestureRecognizer: gesture)
        XCTAssertFalse(defaultValue)

        var callbackCalled = false
        sut.gestureRecognizerShouldBeRequiredToFailBlock = { (gesture, otherGesture) in
            callbackCalled = true
            XCTAssertEqual(gesture, self.gesture)
            XCTAssertEqual(otherGesture, self.gesture)

            return true
        }

        let blockValue = gesture.delegate!.gestureRecognizer!(gesture, shouldBeRequiredToFailByGestureRecognizer: gesture)
        XCTAssertTrue(blockValue)
        XCTAssertTrue(callbackCalled)
    }

    func test_should_require_failure_of_gesture_callback() {
        let defaultValue = gesture.delegate!.gestureRecognizer!(gesture, shouldRequireFailureOfGestureRecognizer: gesture)
        XCTAssertFalse(defaultValue)

        var callbackCalled = false
        sut.gestureRecognizerShouldRequireFailureOfGestureBlock = { (gesture, otherGesture) in
            callbackCalled = true
            XCTAssertEqual(gesture, self.gesture)
            XCTAssertEqual(otherGesture, self.gesture)
            return true
        }

        let blockValue = gesture.delegate!.gestureRecognizer!(gesture, shouldRequireFailureOfGestureRecognizer: gesture)
        XCTAssertTrue(blockValue)
        XCTAssertTrue(callbackCalled)
    }

    func test_should_recognize_simultaneously_callback() {
        let defaultValue = gesture.delegate!.gestureRecognizer!(gesture, shouldRecognizeSimultaneouslyWithGestureRecognizer: gesture)
        XCTAssertFalse(defaultValue)

        var callbackCalled = false
        sut.gestureRecognizerShouldRecognizeSimultaneouslyBlock = { (gesture, otherGesture) in
            callbackCalled = true
            XCTAssertEqual(gesture, self.gesture)
            XCTAssertEqual(otherGesture, self.gesture)
            return true
        }

        let blockValue = gesture.delegate!.gestureRecognizer!(gesture, shouldRecognizeSimultaneouslyWithGestureRecognizer: gesture)
        XCTAssertTrue(blockValue)
        XCTAssertTrue(callbackCalled)
    }

    func test_should_begin_callback() {
        let defaultValue = gesture.delegate!.gestureRecognizerShouldBegin!(gesture)
        XCTAssertTrue(defaultValue)

        var callbackCalled = false
        sut.gestureRecognizerShouldBeginBlock = { (gesture) in
            callbackCalled = true
            XCTAssertEqual(gesture, self.gesture)
            return false
        }

        let blockValue = gesture.delegate!.gestureRecognizerShouldBegin!(gesture)
        XCTAssertFalse(blockValue)
        XCTAssertTrue(callbackCalled)
    }
}
