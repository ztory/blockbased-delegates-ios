//
//  BlockSearchFieldDelegate.swift
//  Pods
//
//  Created by Christian Rönningen on 25/08/16.
//
//

import UIKit
import ObjectiveC

public typealias BlockSearchBarTextDidEndEditing = (searchBar: UISearchBar) -> Void
public typealias BlockSearchBarCancelButtonClicked = (searchBar: UISearchBar) -> Void
public typealias BlockSearchBarSearchButtonClicked = (searchBar: UISearchBar) -> Void
public typealias BlockSearchBarTextDidBeginEditing = (searchBar: UISearchBar) -> Void
public typealias BlockSearchBarBookmarkButtonClicked = (searchBar: UISearchBar) -> Void
public typealias BlockSearchBarResultListButtonClicked = (searchBar: UISearchBar) -> Void
public typealias BlockSearchBarShouldEndEditing = (searchBar: UISearchBar) -> Bool
public typealias BlockSearchBarShouldBeginEditing = (searchBar: UISearchBar) -> Bool
public typealias BlockSearchBarTextDidChange = (searchBar: UISearchBar, searchText: String) -> Void
public typealias BlockSearchBarSelectedScopeButtonIndexDidChange = (searchBar: UISearchBar, selectedScope: Int) -> Void
public typealias BlockSearchBarShouldChangeTextInRange = (searchBar: UISearchBar, range: NSRange, text: String) -> Bool

public class BlockSearchBarDelegate: NSObject, UISearchBarDelegate {

    var searchBarTextDidEndEditingBlock: BlockSearchBarTextDidEndEditing?
    var searchBarCancelButtonClickedBlock: BlockSearchBarCancelButtonClicked?
    var searchBarSearchButtonClickedBlock: BlockSearchBarSearchButtonClicked?
    var searchBarTextDidBeginEditingBlock: BlockSearchBarTextDidBeginEditing?
    var searchBarBookmarkButtonClickedBlock: BlockSearchBarBookmarkButtonClicked?
    var searchBarResultListButtonClickedBlock: BlockSearchBarResultListButtonClicked?
    var searchBarShouldEndEditingBlock: BlockSearchBarShouldEndEditing?
    var searchBarShouldBeginEditingBlock: BlockSearchBarShouldBeginEditing?
    var searchBarTextDidChangeBlock: BlockSearchBarTextDidChange?
    var searchBarSelectedScopeButtonIndexDidChangeBlock: BlockSearchBarSelectedScopeButtonIndexDidChange?
    var searchBarShouldChangeTextInRangeBlock: BlockSearchBarShouldChangeTextInRange?

    public init(searchBarTextDidEndEditingBlock: BlockSearchBarTextDidEndEditing? = nil,
                searchBarCancelButtonClickedBlock: BlockSearchBarCancelButtonClicked? = nil,
                searchBarSearchButtonClickedBlock: BlockSearchBarSearchButtonClicked? = nil,
                searchBarTextDidBeginEditingBlock: BlockSearchBarTextDidBeginEditing? = nil,
                searchBarBookmarkButtonClickedBlock: BlockSearchBarBookmarkButtonClicked? = nil,
                searchBarResultListButtonClickedBlock: BlockSearchBarResultListButtonClicked? = nil,
                searchBarShouldEndEditingBlock: BlockSearchBarShouldEndEditing? = nil,
                searchBarShouldBeginEditingBlock: BlockSearchBarShouldBeginEditing? = nil,
                searchBarTextDidChangeBlock: BlockSearchBarTextDidChange? = nil,
                searchBarSelectedScopeButtonIndexDidChangeBlock: BlockSearchBarSelectedScopeButtonIndexDidChange? = nil,
                searchBarShouldChangeTextInRangeBlock: BlockSearchBarShouldChangeTextInRange? = nil) {
        super.init()
        
        self.searchBarTextDidEndEditingBlock = searchBarTextDidEndEditingBlock
        self.searchBarCancelButtonClickedBlock = searchBarCancelButtonClickedBlock
        self.searchBarSearchButtonClickedBlock = searchBarSearchButtonClickedBlock
        self.searchBarTextDidBeginEditingBlock = searchBarTextDidBeginEditingBlock
        self.searchBarBookmarkButtonClickedBlock = searchBarBookmarkButtonClickedBlock
        self.searchBarResultListButtonClickedBlock = searchBarResultListButtonClickedBlock
        self.searchBarShouldEndEditingBlock = searchBarShouldEndEditingBlock
        self.searchBarShouldBeginEditingBlock = searchBarShouldBeginEditingBlock
        self.searchBarTextDidChangeBlock = searchBarTextDidChangeBlock
        self.searchBarSelectedScopeButtonIndexDidChangeBlock = searchBarSelectedScopeButtonIndexDidChangeBlock
        self.searchBarShouldChangeTextInRangeBlock = searchBarShouldChangeTextInRangeBlock
    }
    
    public func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        guard let block = searchBarTextDidEndEditingBlock else {
            return
        }

        block(searchBar: searchBar)
    }

    public func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        guard let block = searchBarCancelButtonClickedBlock else {
            return
        }

        block(searchBar: searchBar)
    }

    public func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let block = searchBarSearchButtonClickedBlock else {
            return
        }

        block(searchBar: searchBar)
    }

    public func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        guard let block = searchBarTextDidBeginEditingBlock else {
            return
        }

        block(searchBar: searchBar)
    }

    public func searchBarBookmarkButtonClicked(searchBar: UISearchBar) {
        guard let block = searchBarBookmarkButtonClickedBlock else {
            return
        }

        block(searchBar: searchBar)
    }

    public func searchBarResultsListButtonClicked(searchBar: UISearchBar) {
        guard let block = searchBarResultListButtonClickedBlock else {
            return
        }

        block(searchBar: searchBar)
    }

    public func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        guard let block = searchBarShouldEndEditingBlock else {
            return true
        }

        return block(searchBar: searchBar)
    }

    public func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        guard let block = searchBarShouldBeginEditingBlock else {
            return true
        }

        return block(searchBar: searchBar)
    }

    public func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        guard let block = searchBarTextDidChangeBlock else {
            return
        }
        
        block(searchBar: searchBar, searchText: searchText)
    }

    public func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        guard let block = searchBarSelectedScopeButtonIndexDidChangeBlock else {
            return
        }
        
        block(searchBar: searchBar, selectedScope: selectedScope)
    }

    public func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        guard let block = searchBarShouldChangeTextInRangeBlock else {
            return true
        }
        
        return block(searchBar: searchBar, range: range, text: text)
    }
}

public extension UISearchBar {
    private struct AssociatedKeys {
        static var BlockDelegateName = "zm_blockDelegate"
    }
    
    /**
     Convenience parameter to hold strong refernce to blockdelegate
     */
    var blockDelegate: BlockSearchBarDelegate? {
        set {
            delegate = newValue
            objc_setAssociatedObject(self, &AssociatedKeys.BlockDelegateName, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.BlockDelegateName) as? BlockSearchBarDelegate
        }
    }
}
