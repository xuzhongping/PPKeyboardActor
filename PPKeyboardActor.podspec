
Pod::Spec.new do |s|

  s.name         = "PPKeyboardActor"
  s.version      = "0.1.0"
  s.summary      = "easy manager inputView move"

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
 
  s.description  = "非常轻量级的键盘遮挡输入框解决方案"

  s.homepage     = "https://github.com/JungHsu/PPKeyboardActor"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author  = { "JungHsu" => "1021057927@qq.com" }

  s.source       = { :git => "https://github.com/JungHsu/PPKeyboardActor.git", :tag => "#{s.version}" }
  s.source_files  = "PPKeyboardActor/PPKeyboardActor/**/*.{h,m}"
  s.requires_arc = true

end
