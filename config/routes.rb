Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users, only: %i[new create show] do
    get '/discover', to: 'discover#index'
    resources :movies, only: [:index, :show] do
      resources :viewing_parties, only: [:new]
    end
  end
end
