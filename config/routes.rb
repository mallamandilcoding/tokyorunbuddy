Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :runs, only: %i[index show edit update destroy] do
    collection do
      get :trends
    end
  end
  get "/suggestions", to: "runs#suggestions", as: :suggestions
end
