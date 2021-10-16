Rails.application.routes.draw do
  root 'tops#index'
  resources :users
  resources :rooms, :only => [:show, :create] do
    resources :messages, :only => [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
