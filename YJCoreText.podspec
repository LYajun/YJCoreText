#
# Be sure to run `pod lib lint YJCoreText.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YJCoreText'
  s.version          = '1.0.0'
  s.summary          = 'YJCoreText.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/LYajun/YJCoreText'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LYajun' => 'liuyajun1999@icloud.com' }
  s.source           = { :git => 'https://github.com/LYajun/YJCoreText.git', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  
  s.subspec 'Model' do |model|
      model.source_files = 'YJCoreText/Classes/Model/**/*'
      model.dependency 'YJExtensions'
  end
  
  s.subspec 'YJDrawView' do |drawView|
      drawView.source_files = 'YJCoreText/Classes/YJDrawView/**/*'
      drawView.dependency 'YJCoreText/Model'
  end
end
