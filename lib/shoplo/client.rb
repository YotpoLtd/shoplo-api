require 'oauth'
require 'oj'

require 'shoplo/api/customer'
require 'shoplo/api/order'
require 'shoplo/api/product'
require 'shoplo/api/shop'

module Shoplo
  class Client
    include Shoplo::API::Customer
    include Shoplo::API::Order
    include Shoplo::API::Product
    include Shoplo::API::Shop

    def initialize(access_token, token_secret)
      @access_token, @token_secret = access_token, token_secret
    end

    def consumer
      @consumer ||= OAuth::Consumer.new(Shoplo.api_key, Shoplo.secret,
        { site: 'http://api.shoplo.com/services' }
      )
    end

    def connection
      @connection ||= OAuth::AccessToken.new(consumer, @access_token, @token_secret)
    end

    def connection=(new_connection)
      @connection = new_connection
    end

    def get_content(type, params = {})
      id = params.delete(:id).to_i
      id = '' if id <= 0
      response = connection.get("/#{type}/#{id}", params)
      Oj.load(response.body, mode: :compat).values.first
    end
  end

  class InvalidParams < Exception; end
end
