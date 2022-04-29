module API
  class PreniumResourcesController < API::BaseController
    def index
      authorize(current_user, policy_class: UserPolicy)
      render json: { success: true }
    end
  end
end
