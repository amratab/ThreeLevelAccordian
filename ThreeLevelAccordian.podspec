Pod::Spec.new do |s|
 
  # 1
  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.name = "ThreeLevelAccordian"
  s.summary = "ThreeLevelAccordian provides a three level accordian view."
  s.requires_arc = true
 
  # 2
  s.version = "0.1.0"
 
  # 3
  s.license = { :type => "MIT", :file => "LICENSE" }
 
  # 4 - Replace with your name and e-mail address
  s.author = { "Amrata Baghel" => "amrata.baghel@gmail.com" }
 
  # For example,
  # s.author = { "Joshua Greene" => "jrg.developer@gmail.com" }
 
 
  # 5 - Replace this URL with your own Github page's URL (from the address bar)
  s.homepage = "https://github.com/amratab/ThreeLevelAccordian"
 
  # For example,
  # s.homepage = "https://github.com/JRG-Developer/RWPickFlavor"
 
 
  # 6 - Replace this URL with your own Git URL from "Quick Setup"
  s.source = { :git => "https://github.com/amratab/ThreeLevelAccordian.git", :tag => "#{s.version}"}
 
  # For example,
  # s.source = { :git => "https://github.com/JRG-Developer/RWPickFlavor.git", :tag => "#{s.version}"}
 
 
  # 7
  s.framework = "UIKit"
  
  s.source_files = "ThreeLevelAccordian/**/*.{swift}"

#  s.resources = "ThreeLevelAccordian/**/*.{png,jpeg,jpg,storyboard,xib}" 
end
