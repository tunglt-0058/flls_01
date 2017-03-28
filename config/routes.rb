Rails.application.routes.draw do
  root "static_pages#index"
  get "about" => "static_pages#about"
  get "help" => "static_pages#help"

  devise_for :users, controllers: {omniauth_callbacks: "auths/omniauth_callbacks#create"}

  scope :api do
    scope :v1 do
      resources :users, only: [:show] do
        resources :folders, only: [:index, :show, :create]
        resources :subjects, only: [:index, :create]
        resources :sidebar, only: [:index]
      end
    end
  end
end
