# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'chef-flavor-pan'
  s.version = '2.0.0'

  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.require_paths = ['lib']
  s.authors = ['David Echols']
  s.description = 'A Chef automatic cookbook generator for [chef-gen-flavors](https://rubygems.org/gems/chef-gen-flavors).\n\n You can use it out of the box as an opinionated way of creating new cookbooks, or modify it to meet your organization needs.'
  s.extra_rdoc_files = ['CHANGELOG.md', 'README.md']
  s.files = Dir.glob('**/*', File::FNM_DOTMATCH).keep_if { |file| File.file?(file) } - %w(. .. .DS_Store) - Dir.glob('{.git}/**/*')
  s.homepage = 'https://github.com/echohack/pan'
  s.licenses = ['apache2']
  s.rdoc_options = ['--main', 'README.md']
  s.rubygems_version = '2.4.4'
  s.summary = 'A Chef automatic cookbook generator using [chef-gen-flavors](https://rubygems.org/gems/chef-gen-flavors)'

  s.specification_version = 4 if s.respond_to? :specification_version
end
