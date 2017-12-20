require 'faraday'
require 'faraday_middleware'
require 'multi_json'
require 'spyke'

require 'fareharbor/configuration'
require 'fareharbor/json_parser'
require 'fareharbor/version'
require 'fareharbor/resources/agent'
require 'fareharbor/resources/availability'
require 'fareharbor/resources/availability_lodging'
require 'fareharbor/resources/company'
require 'fareharbor/resources/custom_field'
require 'fareharbor/resources/custom_field_instance'
require 'fareharbor/resources/customer_prototype'
require 'fareharbor/resources/customer_type'
require 'fareharbor/resources/customer_type_rate'
require 'fareharbor/resources/desk'
require 'fareharbor/resources/image'
require 'fareharbor/resources/item'
require 'fareharbor/resources/lodging'


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
