module API
  class SessionsController < Devise::SessionsController
    respond_to :json

    def create
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
    end

    private

    def respond_to_on_destroy
      head :no_content
    end
  end
end
