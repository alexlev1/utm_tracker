require_relative 'lib/utm_tracker/version'

Gem::Specification.new do |spec|
  spec.name          = "utm_tracker"
  spec.version       = UtmTracker::VERSION
  spec.authors       = ["Alexander Levashov"]
  spec.email         = ["alevash1@gmail.com"]

  spec.summary       = 'Gem for UTM tags tracking'
  spec.description   = %q{Allow save UTM tags into database}
  spec.homepage      = "https://github.com/alexlev1/utm_tracker"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.1")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/alexlev1/utm_tracker"
  spec.metadata["changelog_uri"] = "https://github.com/alexlev1/utm_tracker"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'pry', '~> 0.13'
  spec.add_development_dependency 'rspec', '~> 3.10.0'
end
