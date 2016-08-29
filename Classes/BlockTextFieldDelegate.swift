//
//  BlockTextFieldDelegate.swift
//  Pods
//
//  Created by Christian Rönningen on 25/08/16.
//
//

import UIKit

public typealias BlockTextFieldShouldChangeCharactersInRange = (textField: UITextField, range: NSRange, string: String) -> Bool
public typealias BlockTextFieldShouldBeginEditing = (textField: UITextField) -> Bool
public typealias BlockTextFieldShouldEndEditing = (textField: UITextField) -> Bool
public typealias BlockTextFieldShouldReturn = (textField: UITextField) -> Bool
public typealias BlockTextFieldShouldClear = (textField: UITextField) -> Bool
public typealias BlockTextFieldDidBeginEditing = (textField: UITextField) -> Void
public typealias BlockTextFieldDidEndEditing = (textField: UITextField) -> Void

public class BlockTextFieldDelegate: NSObject, UITextFieldDelegate {

    var textFieldShouldChangeCharactersInRangeBlock: BlockTextFieldShouldChangeCharactersInRange?
    var textFieldShouldBeginEditingBlock: BlockTextFieldShouldBeginEditing?
    var textFieldShouldEndEditingBlock: BlockTextFieldShouldEndEditing?
    var textFieldShouldReturnBlock: BlockTextFieldShouldReturn?
    var textFieldShouldClearBlock: BlockTextFieldShouldClear?
    var textFieldDidBeginEditingBlock: BlockTextFieldDidBeginEditing?
    var textFieldDidEndEditingBlock: BlockTextFieldDidEndEditing?

    public init(textFieldShouldChangeCharactersInRangeBlock: BlockTextFieldShouldChangeCharactersInRange? = nil,
                textFieldShouldBeginEditingBlock: BlockTextFieldShouldBeginEditing? = nil,
                textFieldShouldEndEditingBlock: BlockTextFieldShouldEndEditing? = nil,
                textFieldShouldReturnBlock: BlockTextFieldShouldReturn? = nil,
                textFieldShouldClearBlock: BlockTextFieldShouldClear? = nil,
                textFieldDidBeginEditingBlock: BlockTextFieldDidBeginEditing? = nil,
                textFieldDidEndEditingBlock: BlockTextFieldDidEndEditing? = nil) {
        super.init()
        
        self.textFieldShouldChangeCharactersInRangeBlock = textFieldShouldChangeCharactersInRangeBlock
        self.textFieldShouldBeginEditingBlock = textFieldShouldBeginEditingBlock
        self.textFieldShouldEndEditingBlock = textFieldShouldEndEditingBlock
        self.textFieldShouldReturnBlock = textFieldShouldReturnBlock
        self.textFieldShouldClearBlock = textFieldShouldClearBlock
        self.textFieldDidBeginEditingBlock = textFieldDidBeginEditingBlock
        self.textFieldDidEndEditingBlock = textFieldDidEndEditingBlock
    }
    
    
    public func textFieldDidEndEditing(textField: UITextField) {

        guard let block = textFieldDidEndEditingBlock else {
            return
        }

        block(textField: textField)
    }

    public func textFieldDidBeginEditing(textField: UITextField) {
        guard let block = textFieldDidBeginEditingBlock else {
            return
        }
        
        block(textField: textField)
    }

    public func textFieldShouldClear(textField: UITextField) -> Bool {
        guard let block = textFieldShouldClearBlock else {
            return true
        }
        
        return block(textField: textField)
    }

    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        guard let block = textFieldShouldReturnBlock else {
            return true
        }
        
        return block(textField: textField)
    }

    public func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        guard let block = textFieldShouldEndEditingBlock else {
            return true
        }
        
        return block(textField: textField)
    }

    public func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        guard let block = textFieldShouldBeginEditingBlock else {
            return true
        }
        
        return block(textField: textField)
    }

    public func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let block = textFieldShouldChangeCharactersInRangeBlock else {
            return true
        }

        return block(textField: textField, range: range, string: string)
    }
}

public extension UITextField {
    private struct AssociatedKeys {
        static var BlockDelegateName = "zm_blockDelegate"
    }

    /**
     Convenience parameter to hold strong refernce to blockdelegate
     */
    var blockDelegate: BlockTextFieldDelegate? {
        set {
            delegate = newValue
            objc_setAssociatedObject(self, &AssociatedKeys.BlockDelegateName, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.BlockDelegateName) as? BlockTextFieldDelegate
        }
    }
}
