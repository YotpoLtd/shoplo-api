module Shoplo
  module API
    module Customer
      def get_customers(params = {})
        get_content('customers', params)
      end
    end
  end
end