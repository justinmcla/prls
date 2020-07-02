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

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = ['lib/prls.rb','lib/prls/bpp.rb','lib/prls/cli.rb','lib/prls/concord.rb','lib/prls/dps.rb',
                        'lib/prls/mti.rb', 'lib/prls/playscripts.rb', 'lib/prls/pro.rb', 'lib/prls/scraper.rb',
                        'lib/prls/version.rb']
  spec.bindir        = "bin"
  spec.executables   << 'prls'
  spec.require_paths = ["lib"]
  
  spec.add_dependency "word_wrap"
  spec.add_dependency "rake"
  spec.add_dependency "nokogiri"
  spec.add_dependency "rspec"


end
