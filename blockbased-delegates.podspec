#
# Be sure to run `pod lib lint blockbased-delegates.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'blockbased-delegates'
  s.version          = '0.1.0'
  s.summary          = 'A short description of blockbased-delegates.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/<GITHUB_USERNAME>/blockbased-delegates'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ChristianRonningen' => 'christian.ronningen@ztory.com' }
  s.source           = { :git => 'https://github.com/ztory/blockbased-delegates.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'blockbased-delegates/Classes/**/*'

  s.frameworks = 'UIKit'
end
