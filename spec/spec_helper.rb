require 'bundler/setup'
require 'fareharbor'
require 'webmock/rspec'

Dir[File.join("spec/support/**/*.rb")].each { |f| require "./#{f}" }

module FixturesHelper
  def fixture(fixture_path)
    open(File.join('spec', 'fixtures', fixture_path)).read
  end
end

RSpec.configure do |config|
  config.include FixturesHelper

  config.before(:all) do
    Fareharbor.configure do |config|
      config.app_token = 'app-token'
      config.user_token = 'user-token'
    end
  end

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
