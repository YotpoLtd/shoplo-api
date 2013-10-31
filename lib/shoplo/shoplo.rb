require 'shoplo/api/client'

module Shoplo
  class << self
    def client(params)
      @client ||= Shoplo::Client.new(params)
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