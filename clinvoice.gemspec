# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'clinvoice/version'

Gem::Specification.new do |spec|
  spec.name          = 'clinvoice'
  spec.version       = Clinvoice::VERSION
  spec.authors       = ['Andrew S Aguiar']
  spec.email         = ['andrewaguiar6@gmail.com']
  spec.summary       = 'Generates invoices using command line'
  spec.description   = 'Generates invoices using command line based on yaml file'
  spec.homepage      = 'https://github.com/andrewaguiar/clinvoice'
  spec.license       = 'MIT'

  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development 'prawn', '~> 2.2'
  spec.add_development 'prawn-table', '~> 0.2.2'
end