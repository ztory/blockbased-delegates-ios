//
//  SearchBarBlockDelegateTests.swift
//  blockbased-delegates
//
//  Created by Christian Rönningen on 25/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest

@testable import blockbased_delegates

class SearchBarBlockDelegateTests: XCTestCase {

    var sut: BlockSearchBarDelegate!
    var searchBar: UISearchBar!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = BlockSearchBarDelegate()
        searchBar = UISearchBar()
        searchBar.blockDelegate = sut
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_delegate_has_been_set() {
        if let delegate = searchBar.delegate as? BlockSearchBarDelegate {
            XCTAssertEqual(delegate, sut)
        } else {
            XCTFail("Wrong or no delegate set")
        }
    }
    
    func test_searchbar_did_end_editing() {
        var callbackCalled = false
        
        sut.searchBarTextDidEndEditingBlock = { (searchBar) in
            XCTAssertEqual(searchBar, self.searchBar)
            callbackCalled = true
        }
        
        searchBar.delegate!.searchBarTextDidEndEditing!(searchBar)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_searchbar_cancel_button_clicked() {
        var callbackCalled = false
        
        sut.searchBarCancelButtonClickedBlock = { (searchBar) in
            XCTAssertEqual(searchBar, self.searchBar)
            callbackCalled = true
        }
        
        searchBar.delegate!.searchBarCancelButtonClicked!(searchBar)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_searchbar_search_button_clicked() {
        var callbackCalled = false
        
        sut.searchBarSearchButtonClickedBlock = { (searchBar) in
            XCTAssertEqual(searchBar, self.searchBar)
            callbackCalled = true
        }
        
        searchBar.delegate!.searchBarSearchButtonClicked!(searchBar)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_searchbar_text_did_begin_editing() {
        var callbackCalled = false
        
        sut.searchBarTextDidBeginEditingBlock = { (searchBar) in
            XCTAssertEqual(searchBar, self.searchBar)
            callbackCalled = true
        }
        
        searchBar.delegate!.searchBarTextDidBeginEditing!(searchBar)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_searchbar_bookmark_button_pressed() {
        var callbackCalled = false
        
        sut.searchBarBookmarkButtonClickedBlock = { (searchBar) in
            XCTAssertEqual(searchBar, self.searchBar)
            callbackCalled = true
        }
        
        searchBar.delegate!.searchBarBookmarkButtonClicked!(searchBar)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_searchbar_result_list_button_pressed() {
        var callbackCalled = false
        
        sut.searchBarResultListButtonClickedBlock = { (searchBar) in
            XCTAssertEqual(searchBar, self.searchBar)
            callbackCalled = true
        }
        
        searchBar.delegate!.searchBarResultsListButtonClicked!(searchBar)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_searchbar_should_end_editing() {
        var callbackCalled = false
        
        let defaultValue = searchBar.delegate!.searchBarShouldEndEditing!(searchBar)
        XCTAssertTrue(defaultValue)
        
        sut.searchBarShouldEndEditingBlock = { (searchBar) in
            XCTAssertEqual(searchBar, self.searchBar)
            callbackCalled = true
            
            return false
        }
        
        let blockValue = searchBar.delegate!.searchBarShouldEndEditing!(searchBar)
        XCTAssertFalse(blockValue)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_searchbar_should_begin_editing() {
        var callbackCalled = false
        
        let defaultValue = searchBar.delegate!.searchBarShouldBeginEditing!(searchBar)
        XCTAssertTrue(defaultValue)
        
        sut.searchBarShouldBeginEditingBlock = { (searchBar) in
            XCTAssertEqual(searchBar, self.searchBar)
            callbackCalled = true
            
            return false
        }
        
        let blockValue = searchBar.delegate!.searchBarShouldBeginEditing!(searchBar)
        XCTAssertFalse(blockValue)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_searchbar_text_did_change() {
        var callbackCalled = false
        
        let inputText = "test"
        
        sut.searchBarTextDidChangeBlock = { (searchBar,text) in
            XCTAssertEqual(text, inputText)
            XCTAssertEqual(searchBar, self.searchBar)
            callbackCalled = true
        }
        
        searchBar.delegate!.searchBar!(searchBar, textDidChange: inputText)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_searchbar_selected_scope_button_index_did_change() {
        var callbackCalled = false
        
        let inputScope = 1
        
        sut.searchBarSelectedScopeButtonIndexDidChangeBlock = { (searchBar,scope) in
            XCTAssertEqual(scope, inputScope)
            XCTAssertEqual(searchBar, self.searchBar)
            callbackCalled = true
        }
        
        searchBar.delegate!.searchBar!(searchBar, selectedScopeButtonIndexDidChange: inputScope)
        
        XCTAssertTrue(callbackCalled)
    }
    
    func test_searchbar_should_change_text_in_range() {
        var callbackCalled = false
        
        let inputRange = NSRange(location: 0, length: 4)
        let inputText = "test"
        
        let defaultValue = searchBar.delegate!.searchBar!(searchBar, shouldChangeTextInRange: inputRange, replacementText: inputText)
        XCTAssertTrue(defaultValue)
        
        sut.searchBarShouldChangeTextInRangeBlock = { (searchBar,range,text) in
            XCTAssertEqual(searchBar, self.searchBar)
            XCTAssertEqual(text, inputText)
            XCTAssertEqual(range, inputRange)
            callbackCalled = true
            
            return false
        }
        
        let blockValue = searchBar.delegate!.searchBar!(searchBar, shouldChangeTextInRange: inputRange, replacementText: inputText)
        XCTAssertFalse(blockValue)
        
        XCTAssertTrue(callbackCalled)
    }
}
