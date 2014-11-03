require 'webmock/rspec'
require 'insightly'
require 'vcr'
include Insightly::Resources

APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

def cnf
  YAML::load_file(File.join(APP_ROOT, 'config/gem_secret.yml'))
end

def client
  Insightly::Client.new(cnf['insightly_api_key'])
end

def insightly_api_key
  cnf['insightly_api_key']
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<INSIGHTLY_API_KEY>') { cnf['insightly_api_key'] }
end
