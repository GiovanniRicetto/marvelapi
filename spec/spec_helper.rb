require 'httparty'
require 'digest'
require 'pry'
require 'json-schema'
require 'json_matchers/rspec'
require 'json'


JsonMatchers.schema_root = "./schemas"

$auth = YAML.load_file('common\auth.yml')
$env = YAML.load_file('common\environment.yml')

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
