Gem::Specification.new do |spec|
  spec.name          = "fluentd-plugin-drop-by-timestamp"
  spec.version = "0.1.0"
  spec.authors = ["Dmitry K. Anisimov"]
  spec.email   = ["mail@anisimov.dk"]
  spec.description   = %q{fluent plugin to drop records by timestamp}
  spec.summary       = %q{fluent kubernetes timestamp drop}
  spec.homepage      = "https://github.com/anisimovdk/fluentd-plugin-drop-by-timestamp"
  spec.license       = "Apache-2.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "fluentd", [">= 0.14.0", "< 2"]
  spec.add_development_dependency "rake", "~> 11.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  # spec.add_development_dependency "test-unit", "~> 3.2"
end
