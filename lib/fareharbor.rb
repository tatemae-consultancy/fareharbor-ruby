require 'faraday'
require 'faraday_middleware'
require 'multi_json'
require 'spyke'

require 'fareharbor/agent'
require 'fareharbor/availability_lodging'
require 'fareharbor/company'
require 'fareharbor/configuration'
require 'fareharbor/desk'
require 'fareharbor/item'
require 'fareharbor/json_parser'
require 'fareharbor/lodging'
require 'fareharbor/version'

module Fareharbor
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
    configure_spyke
  end

  def self.configure_spyke
    Spyke::Base.connection = Faraday.new(url: configuration.fareharbor_url) do |conn|
      conn.request :json
      conn.use Fareharbor::JSONParser
      conn.adapter Faraday.default_adapter
      conn.headers['X-FareHarbor-API-App'] = configuration.app_token
      conn.headers['X-FareHarbor-API-User'] = configuration.user_token
    end
  end
end
