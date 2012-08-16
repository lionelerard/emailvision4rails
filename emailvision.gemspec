Gem::Specification.new do |s|
  s.name = "emailvision"
  s.summary = "Manage campaigns and messages from your rails application"
  s.description = "Manage campaigns and messages from your rails application"
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"
	
	s.authors     = ['Bastien Gysler']  
	s.email       = "basgys@gmail.com"
  s.homepage    = "http://www.bastiengysler.com"  

  s.add_dependency("railties", "~> 3.1")
end