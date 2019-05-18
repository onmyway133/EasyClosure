Pod::Spec.new do |s|
  s.name             = "EasyClosure"
  s.summary          = "Unified communication with easy closure in Swift"
  s.version          = "1.0.0"
  s.homepage         = "https://github.com/onmyway133/EasyClosure"
  s.license          = 'MIT'
  s.author           = { "Khoa Pham" => "onmyway133@gmail.com" }
  s.source           = {
    :git => "https://github.com/onmyway133/EasyClosure.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/onmyway133'

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.13'

  s.requires_arc = true
  s.ios.source_files = 'Sources/{iOS,Shared}/**/*'
  s.osx.source_files = 'Sources/{macOS,Shared}/**/*'
  s.tvos.source_files = 'Sources/{iOS,Shared}/**/*'

  s.ios.frameworks = 'UIKit', 'Foundation'
  s.tvos.frameworks = 'UIKit', 'Foundation'
  s.osx.frameworks = 'Cocoa', 'Foundation'

  s.swift_version = '5.0'
end
