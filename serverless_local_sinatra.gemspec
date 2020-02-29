
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "serverless_local_sinatra/version"

Gem::Specification.new do |spec|
  spec.name          = "serverless_local_sinatra"
  spec.version       = ServerlessLocalSinatra::VERSION
  spec.authors       = ["Piotr Szmielew"]
  spec.email         = ["p.szmielew@ava.waw.pl"]

  spec.summary       = %q{Simple wrapper around serverless framework}
  spec.description   = %q{Simple wrapper around serverless framework}
  spec.homepage      = "https://github.com/esse/serverless_local_sinatra"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.executables = ['serverless_local_sinatra']
  spec.default_executable = 'serverless_local_sinatra'

  spec.add_dependency "sinatra"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
