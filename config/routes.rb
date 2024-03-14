Rails.application.routes.draw do
  resource :home, only: :index
  resources :users, only: [:index, :create] do
    collection do
      get :login
      get :logout
    end
  end
  resources :posts, only: [:index, :create]

  root to: "home#index"
end



# Rails.application.routes.draw do
#   resource :home, only: :index
#   resources :users, only: :create

#   root to: "home#index"
# end
