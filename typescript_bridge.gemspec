# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'typescript_bridge/version'

Gem::Specification.new do |spec|
  spec.name = 'typescript_bridge'
  spec.version = TypescriptBridge::VERSION
  spec.author = 'Eli Sadoff'
  spec.email = 'snood1205@gmail.com'

  spec.summary = 'This gem provides a bridge between ruby and typescript.'
  spec.homepage = 'https://github.com/snood1205/typescript_bridge'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w(lib)
end
