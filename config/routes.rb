Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "videos#index"
  devise_for :users
  resources :videos

  mount VideosManager::API => '/'
end
