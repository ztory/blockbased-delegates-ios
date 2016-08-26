//
//  TextFieldBlockDelegateTests.swift
//  blockbased-delegates
//
//  Created by Christian Rönningen on 25/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

@testable import blockbased_delegates_ios

class TextFieldBlockDelegateTests: XCTestCase {

    var sut: BlockTextFieldDelegate!
    var textField: UITextField!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        sut = BlockTextFieldDelegate()
        textField = UITextField()
        textField.blockDelegate = sut
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_delegate_has_been_set() {
        if let delegate = textField.delegate as? BlockTextFieldDelegate {
            XCTAssertEqual(delegate, sut)
        } else {
            XCTFail("Wrong or no delegate set")
        }
    }

    func test_textfield_should_change_characters_in_range() {
        var callbackCalled = false

        let inputRange = NSRange(location: 0, length: 4)
        let inputString = "test"

        let defaultValue = textField.delegate!.textField!(textField, shouldChangeCharactersInRange: inputRange, replacementString: inputString)
        XCTAssertTrue(defaultValue)

        sut.textFieldShouldChangeCharactersInRangeBlock = { (textField, range, string) in
            XCTAssertEqual(textField, self.textField)
            XCTAssertEqual(range, inputRange)
            XCTAssertEqual(string, inputString)
            callbackCalled = true

            return false
        }

        let blockValue = textField.delegate!.textField!(textField, shouldChangeCharactersInRange: inputRange, replacementString: inputString)
        XCTAssertFalse(blockValue)

        XCTAssertTrue(callbackCalled)
    }

    func test_textfield_should_begin_editing() {
        var callbackCalled = false

        let defaultValue = textField.delegate!.textFieldShouldBeginEditing!(textField)
        XCTAssertTrue(defaultValue)

        sut.textFieldShouldBeginEditingBlock = { (textField) in
            XCTAssertEqual(textField, self.textField)

            callbackCalled = true

            return false
        }

        let blockValue = textField.delegate!.textFieldShouldBeginEditing!(textField)
        XCTAssertFalse(blockValue)

        XCTAssertTrue(callbackCalled)
    }
    
    func test_textfield_should_end_editing() {
        var callbackCalled = false
        
        let defaultValue = textField.delegate!.textFieldShouldEndEditing!(textField)
        XCTAssertTrue(defaultValue)
        
        sut.textFieldShouldEndEditingBlock = { (textField) in
            XCTAssertEqual(textField, self.textField)
            
            callbackCalled = true
            
            return false
        }
        
        let blockValue = textField.delegate!.textFieldShouldEndEditing!(textField)
        XCTAssertFalse(blockValue)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_textfield_should_return() {
        var callbackCalled = false
        
        let defaultValue = textField.delegate!.textFieldShouldReturn!(textField)
        XCTAssertTrue(defaultValue)
        
        sut.textFieldShouldReturnBlock = { (textField) in
            XCTAssertEqual(textField, self.textField)
            
            callbackCalled = true
            
            return false
        }
        
        let blockValue = textField.delegate!.textFieldShouldReturn!(textField)
        XCTAssertFalse(blockValue)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_textfield_should_clear() {
        var callbackCalled = false
        
        let defaultValue = textField.delegate!.textFieldShouldClear!(textField)
        XCTAssertTrue(defaultValue)
        
        sut.textFieldShouldClearBlock = { (textField) in
            XCTAssertEqual(textField, self.textField)
            
            callbackCalled = true
            
            return false
        }
        
        let blockValue = textField.delegate!.textFieldShouldClear!(textField)
        XCTAssertFalse(blockValue)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_textfield_did_begin_editing() {
        var callbackCalled = false
        
        sut.textFieldDidBeginEditingBlock = { (textField) in
            XCTAssertEqual(textField, self.textField)
            
            callbackCalled = true
        }
        
        textField.delegate!.textFieldDidBeginEditing!(textField)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_textfield_did_end_editing() {
        var callbackCalled = false
        
        sut.textFieldDidEndEditingBlock = { (textField) in
            XCTAssertEqual(textField, self.textField)
            
            callbackCalled = true
        }
        
        textField.delegate!.textFieldDidEndEditing!(textField)
        
        XCTAssertTrue(callbackCalled)
    }
}

extension NSRange: Equatable {

}

public func ==(lhs: NSRange, rhs: NSRange) -> Bool {
    return lhs.location == rhs.location && lhs.length == rhs.length
}
