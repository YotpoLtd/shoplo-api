require 'oauth'
require 'oj'
require 'uri'

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
      _uri = "/#{type}"
      _uri += "/#{id}" unless id.to_s.empty?
      _params = URI.encode_www_form(params)
      _uri += "?#{_params}" unless params.to_s.empty?
      response = connection.get(_uri)
      json = Oj.load(response.body, mode: :compat)

      raise HTTPUnauthorized.new(json['error_msg']) unless json['error'].nil?

      json.values.first
    end
  end

  class InvalidParams < Exception; end
  class HTTPUnauthorized < Exception; end
end
