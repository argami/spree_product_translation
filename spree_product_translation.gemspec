# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_product_translation'
  s.version     = '0.70.1'
  s.summary     = 'Translate products in multiple languages'
  s.description = 'Translate products in multiple languages'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Gamaliel A. Toro'
  s.email             = 'argami@gmail.com'
  s.homepage          = 'https://github.com/argami'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'globalize3', '~> 0.2.0.beta3'
  s.add_dependency 'spree_core', '>= 0.70.1'
  s.add_development_dependency 'rspec-rails'
end

