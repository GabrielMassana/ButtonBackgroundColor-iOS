Pod::Spec.new do |s|

  s.name         = "ButtonBackgroundColor"
  s.version      = "3.0.0"
  s.summary      = "Category to handle the background color of a UIButton in normal and highlighted state."

  s.homepage     = "https://github.com/GabrielMassana"
  s.license      = { :type => 'MIT', :file => 'LICENSE.md'}
  s.author       = { "Gabriel Massana" => "gabrielmassana@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/GabrielMassana/ButtonBackgroundColor-iOS.git", :tag => s.version, :branch => "master"}
  
  s.source_files  = "ButtonBackgroundColor-iOS/**/*.swift"

  s.requires_arc = true

end

