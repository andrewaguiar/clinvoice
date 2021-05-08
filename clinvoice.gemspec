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

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_dependency 'prawn', '~> 2.2'
  spec.add_dependency 'prawn-table', '~> 0.2.2'
end
