require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]
  s.source       = package["source"]

  s.platform          = :ios, '12.1'
  s.requires_arc      = true
  s.static_framework  = true

  s.source = { :path => "." }

  # Reference your built xcframework (adjust path if needed)
  s.vendored_frameworks = [
    "**/binaries/ffmpegkit.xcframework",
    "**/binaries/libavcodec.xcframework",
    "**/binaries/libavdevice.xcframework",
    "**/binaries/libavfilter.xcframework",
    "**/binaries/libavformat.xcframework",
    "**/binaries/libavutil.xcframework",
    "**/binaries/libswresample.xcframework",
    "**/binaries/libswscale.xcframework",
  ]

  s.source_files = '**/FFmpegKitReactNativeModule.m', '**/FFmpegKitReactNativeModule.h'

  s.dependency "React-Core"
end
