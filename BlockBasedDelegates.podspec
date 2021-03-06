#
# Be sure to run `pod lib lint blockbased-delegates.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BlockBasedDelegates'
  s.module_name      = 'BlockBasedDelegates'
  s.version          = '0.1.0'
  s.summary          = 'Convenience files added to add a block as delegate instead'

  s.description      = <<-DESC
    Current supported is UIWebVIewDelegate, UIScrollViewDelegate, UIGestureRecognizerDelegate, UISearchBarDelegate
    Add issue on github if more is wanted
                       DESC

  s.homepage         = 'https://github.com/ztory/blockbased-delegates-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ChristianRonningen' => 'christian.ronningen@ztory.com' }
  s.source           = { :git => 'https://github.com/ztory/blockbased-delegates-ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.requires_arc = true
  s.source_files = 'Classes/*.swift'

  s.frameworks = 'UIKit'
end
