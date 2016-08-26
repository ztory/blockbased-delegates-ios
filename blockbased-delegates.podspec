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
    Convenience files added to add a block as delegate instead
                       DESC

  s.homepage         = 'https://github.com/ztory/blockbased-delegates-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ChristianRonningen' => 'christian.ronningen@ztory.com' }
  s.source           = { :git => 'git@github.com:ztory/blockbased-delegates-ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Classes/**'

  s.frameworks = 'UIKit'
end
