Rails.application.routes.draw do
  # ----- API -----
  scope :api, module: :api, defaults: { format: :json } do
    resources :procedures, only: :index
  end

  root 'front/search#index'
end
