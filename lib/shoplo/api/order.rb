module Shoplo
  class API
    module Order
      def get_orders(params = {})
        get_content('orders', params)
      end
    end
  end
end