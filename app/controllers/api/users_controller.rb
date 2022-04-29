module API
  class UsersController < API::BaseController
    skip_before_action :authenticate_user!, only: [:create]

    def create
      @user = User.new(user_params)
      return if @user.save

      response_error(message: "Validation errors in your request.", validation_errors: @user.errors.messages)
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :avatar)
    end
  end
end
