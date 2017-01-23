Pod::Spec.new do |s|
  s.name             = "SuperLayout"
  s.version          =  "0.2.1"
  s.summary          = "The simplest and cleanest way to use layout anchors in Swift."

  s.homepage         = "https://github.com/lionheart/SuperLayout"
  s.license          = { :type => 'Apache 2.0', :file => "LICENSE" }
  s.author           = { "Dan Loewenherz" => "dan@lionheartsw.com" }
  s.source           = { :git => "https://github.com/lionheart/SuperLayout.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/lionheartsw'

  s.requires_arc = true
  s.ios.deployment_target = '9.3'

  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '3.0'
  }

  s.subspec 'Core' do |spec|
    spec.source_files = ['Sources/*']
  end
end
