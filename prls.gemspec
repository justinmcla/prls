require_relative 'lib/prls/version'

Gem::Specification.new do |spec|
  spec.name          = "prls"
  spec.version       = PRLS::VERSION
  spec.authors       = ["Justin McLawhorn"]
  spec.email         = ["jwmclawhorn@gmail.com"]

  spec.summary       = "Fetches featured plays from Performance Rights Organizations (PROs)."
  spec.homepage      = "https://github.com/justinmcla/prls"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/justinmcla/prls"
#  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   << 'prls'
  spec.require_paths = ["lib"]
end
