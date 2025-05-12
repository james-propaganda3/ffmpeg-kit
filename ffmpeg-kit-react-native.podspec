require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platform          = :ios, '12.1'
  s.requires_arc      = true
  s.static_framework  = true

  # No remote source required since using local framework
  # s.source = { ... }

  # Reference your built xcframework (adjust path if needed)
  s.vendored_frameworks = 'ios/Frameworks/ffmpegkit.xcframework'

  s.source_files = '**/FFmpegKitReactNativeModule.m', '**/FFmpegKitReactNativeModule.h'

  s.dependency "React-Core"
end
