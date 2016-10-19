# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mexican/states/version'

Gem::Specification.new do |spec|
  spec.name          = 'mexican-states'
  spec.version       = Mexican::States::VERSION
  spec.authors       = ['Carlos Omana']
  spec.email         = ['hello@disblu.com']

  spec.summary       = 'This gem contains data of every state, city and ' \
                        'neighborhood in Mexico'
  spec.description   = 'The gem will create 3 models (State, City and' \
                       'Neighborhood)'
  spec.homepage      = 'https://github.com/disblu/mexican-states'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2 or newer, required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
