Pod::Spec.new do |s|
  s.name         = "SBAActionSheetPicker"
  s.version      = "1.1"
  s.summary      = "Easy to use customised action sheet picker inspired by UIAlertController"
  s.homepage     = "https://github.com/shoaib-akhtar/SBAActionSheetPicker"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Shoaib Akhtar" => "shoaib.akhtar1@live.com" }
  s.source       = { :git => "https://github.com/shoaib-akhtar/SBAActionSheetPicker.git", :branch => "master",
                     :tag => s.version.to_s }
  s.platform     = :ios, '9.0'
  s.requires_arc = true
  s.source_files = "SBAActionSheetPicker/*.swift"
  s.resource_bundles = { "SBAActionSheetPicker" => "SBAActionSheetPicker/*.{lproj,storyboard}" }
  s.resource = 'SBAActionSheetPicker/SBAActionSheetPicker.storyboard'
  s.frameworks   = 'Foundation', 'UIKit'
  s.swift_version = '4.2'
end
