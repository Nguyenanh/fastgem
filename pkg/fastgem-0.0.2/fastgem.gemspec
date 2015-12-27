# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','fastgem','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'fastgem'
  s.version = Fastgem::VERSION
  s.author = 'Nguyen Anh'
  s.email = 'cauut2117610@gmail.com'
  s.homepage = 'https://github.com/Nguyenanh/fastgem'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Search Gem color via terminal rubygem'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','fastgem.rdoc']
  s.rdoc_options << '--title' << 'fastgem' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << "fastgem"
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('terminal-table', '1.5.2')
  s.add_development_dependency('rainbow', '2.0')
  s.add_runtime_dependency('gli','2.13.4')
end
