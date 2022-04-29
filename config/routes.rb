Rails
  .application
  .routes
  .draw do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)

    root "admin/dashboard#index"

    scope :api, module: :api, defaults: { format: :json } do
      devise_for :users,
                 skip: %i[registrations],
                 path: "",
                 path_names: {
                   sign_in: "login",
                   sign_out: "logout"
                 },
                 controllers: {
                   sessions: "api/sessions"
                 }

      resources :prenium_resources
      resources :users
    end
  end
