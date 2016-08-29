# blockbased-delegates

[![CI Status](http://img.shields.io/travis/ChristianRonningen/blockbased-delegates.svg?style=flat)](https://travis-ci.org/ChristianRonningen/blockbased-delegates)
[![Version](https://img.shields.io/cocoapods/v/blockbased-delegates.svg?style=flat)](http://cocoapods.org/pods/blockbased-delegates)
[![License](https://img.shields.io/cocoapods/l/blockbased-delegates.svg?style=flat)](http://cocoapods.org/pods/blockbased-delegates)
[![Platform](https://img.shields.io/cocoapods/p/blockbased-delegates.svg?style=flat)](http://cocoapods.org/pods/blockbased-delegates)

## Current implementation
- [x] UIWebViewDelegate
- [x] UIGestureRecognizer
- [x] UIScrollViewDelegate
- [x] UITextFieldDelegate
- [x] UISearchBarDelegate

## Example

```
let gesture = UITapGestureRecognizer()
gesture.blockDelegate = BlockGestureRecognizerDelegate()
view.addGestureRecognizer(gesture)
```

## Requirements

## Installation

BlockBased-Delegates is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
source 'git@github.com:ztory/Cocoa-Specs.git'
pod "blockbased-delegates-ios"
```

## Author

ChristianRonningen, christian.ronningen@ztory.com

## License

BlockBased-Delegates is available under the MIT license. See the LICENSE file for more info.
