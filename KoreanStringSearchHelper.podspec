#
# Be sure to run `pod lib lint KoreanStringSearchHelper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KoreanStringSearchHelper'
  s.version          = '1.0.0'
  s.summary          = 'Support Korean initial search and Korean partial search.'
  s.swift_versions = '5.0'
  
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'initial search => 초성 검색 ex) ㄱㄴㄷ => 가나다 partial search => 자소 분리 검색 ex) 간 => 가나'

  s.homepage         = 'https://github.com/jykim99/Korean-string-search-helper-iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '42582071' => 'jykim99' }
  s.source           = { :git => 'https://github.com/jykim99/Korean-string-search-helper-iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'KoreanStringSearchHelper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KoreanStringSearchHelper' => ['KoreanStringSearchHelper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
