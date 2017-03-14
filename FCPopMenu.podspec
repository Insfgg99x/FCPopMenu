Pod::Spec.new do |s|
s.name         = "FCPopMenu"
s.version      = “1.1”
s.summary      = "FCPopMenu is an easy way to make a popover menu view."
s.homepage     = "https://github.com/Insfgg99x/FCPopMenu"
s.license      = "MIT"
s.authors      = { "CGPointZero" => "newbox0512@yahoo.com" }
s.source       = { :git => "https://github.com/Insfgg99x/FCPopMenu.git", :tag => “1.1” }
s.frameworks   = 'Foundation','UIKit'
s.platform     = :ios, '6.0'
s.source_files = 'FCPopMenu/*.{h,m}'
s.requires_arc = true
#s.dependency 'SDWebImage'
#s.dependency 'pop'
end