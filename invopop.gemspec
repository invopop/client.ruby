# frozen_string_literal: true

require_relative 'lib/invopop/version'

Gem::Specification.new do |spec|
  spec.name = 'invopop'
  spec.version = Invopop::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.summary = 'Invopop API Ruby Client'
  spec.homepage = 'https://github.com/invopop/client.ruby'
  spec.license = 'Apache-2.0'
  spec.authors = ['Sam Lown', 'Luismi Cavallé']

  spec.required_ruby_version = '>= 2.7'
  spec.required_rubygems_version = '>= 3.1.4'

  spec.files = Dir.glob('lib/**/*') + [__FILE__]
  spec.require_paths = ['lib']

  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }

  spec.add_dependency 'faraday', '~> 2.5'
  spec.add_dependency 'gobl', '~> 0.2.0'
  spec.add_dependency 'hashme', '~> 0.2.6'
end
