module Shoplo
  module API
    module Product
      def get_products(params = {})
        get_content('products', params)
      end
    end
  end
end