module API
  class UsersController < API::BaseController
    skip_before_action :authenticate_user!, only: [:create]

    # POST api/users
    def create
      if params[:is_tps] == "true"
        @customer = TpsCustomer.new(customer_params)
      else
        @customer = Customer.new(customer_params)
      end

      @customer.save
    end

    private

    def customer_params
      params.permit(:email, :full_name, :user_type, :phone_number)
    end
  end
end
