module API
  class BaseController < ApplicationController
    include Pundit

    before_action :authenticate_user!

    rescue_from ActiveRecord::RecordInvalid do
      response_error(status: :bad_request)
    end

    rescue_from ActiveRecord::RecordNotFound do
      response_error(status: :not_found, message: "The resource does not exist")
    end

    rescue_from Pundit::NotAuthorizedError do
      response_error(status: :forbidden, message: "You don't have permission to perform this action")
    end

    rescue_from ActionController::ParameterMissing do
      response_error(message: "Param is missing or the value is empty")
    end

    def response_error(
      status: :bad_request,
      message: "Validation errors in your request.",
      errors: [],
      validation_errors: nil
    )
      errors_array = errors
      errors_array = ErrorService.new(validation_errors).perform if validation_errors

      render json: { message: message, errors: errors_array }, status: status
    end

    def fetch_data_pagination
      @per_page = params[:per_page].to_i.zero? ? Kaminari.config.default_per_page : params[:per_page].to_i
      @page = params[:page].to_i.zero? ? 1 : params[:page].to_i
    end
  end
end
