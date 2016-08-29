//
//  SearchBarViewController.swift
//  blockbased-delegates
//
//  Created by Christian Rönningen on 29/08/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

import blockbased_delegates_ios

class SearchBarViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.blockDelegate = BlockSearchBarDelegate(searchBarShouldBeginEditingBlock: { _ in
            NSLog("Inside block delegate")

            return true
        })
    }
}
