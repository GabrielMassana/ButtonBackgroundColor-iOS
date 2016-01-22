Pod::Spec.new do |s|

  s.name         = "ButtonBackgroundColor"
  s.version      = "1.0.8"
  s.summary      = "Category to handle the background color of a UIButton in normal and selected state."

  s.homepage     = "https://github.com/GabrielMassana"
  s.license      = { :type => 'MIT', :file => 'LICENSE.md'}
  s.author       = { "Gabriel Massana" => "gabrielmassana@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/GabrielMassana/ButtonBackgroundColor-iOS.git", :tag => s.version, :branch => "master"}
  
  s.source_files  = "ButtonBackgroundColor-iOS/**/*.{h,m}"

  s.requires_arc = true

end

