# blockbased-delegates

[![CI Status](https://travis-ci.org/ztory/blockbased-delegates-ios.svg?branch=master)](https://travis-ci.org/ChristianRonningen/blockbased-delegates-ios)

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
