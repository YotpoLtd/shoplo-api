require 'shoplo/client'
require 'shoplo/version'

module Shoplo
  class << self
    # @!attribute api_key
    # @return [String] the API key that is registered with Shoplo
    attr_accessor :api_key

    # @!attribute secret
    # @return [String] the secret that is registered with Shoplo
    attr_accessor :secret

    # Configuration interface of the gem
    #
    # @yield [self] to accept configuration settings
    def configure
      yield self
      true
    end

    def client(access_token, token_secret)
      @client ||= Shoplo::Client.new(access_token, token_secret)
    end

    #
    # Makes sure that the method missing is checked with the Shoplo::Client instance
    #
    # @param method_name [String] the name of the method we want to run
    # @param include_private [Boolean] defines whether to check for private functions as well
    def respond_to_missing?(method_name, include_private=false)
      client.respond_to?(method_name, include_private)
    end

    private
    #
    # executes any function on the Shoplo::Client instance
    #
    # @param args [*] any argument that we want to pass to the client function
    # @param block [Block] any block that is passed to the client function
    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end
end