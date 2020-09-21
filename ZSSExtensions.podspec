#
# Be sure to run `pod lib lint ZSSExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZSSExtensions'
  s.version          = '0.3.0'
  s.summary          = 'Extensions and commonly used pieces of code to share across various projects.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/socialthingco/ZSSExtensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zachary Shakked' => 'zach@shakd.io' }
  s.source           = { :git => 'https://github.com/socialthingsco/ZSSExtensions.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'ZSSExtensions/Classes/**/*'
  s.swift_version = '5.0'
  # s.resource_bundles = {
  #   'ZSSExtensions' => ['ZSSExtensions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'DeviceKit'
  
end
