
Pod::Spec.new do |s|

s.name          = "KPMask"
s.version       = "0.0.5"
s.summary       = "Easy way to build Mask View"
s.homepage      = "https://github.com/liukunpengiOS"
s.license       = "MIT"
s.author        = { "kunpeng" => "1169405067@qq.com" }
s.platform      = :ios, "8.0"
s.source        = { :git => "https://github.com/liukunpengiOS/KPMask.git", :tag => "0.0.5" }
s.source_files  = "KPMask", "KPMask/**/*.{h,m}"
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
s.requires_arc  = true
s.dependency "YXEasing"

end
