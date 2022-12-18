Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"

  resources :users, only: [:new, :create, :destroy]

  resources :sessions , only: [:create] do
    collection do 
      get 'log_in', to: 'sessions#new', as: :new
      delete 'log_out', to: 'sessions#delete', as: :delete
    end
  end

end
