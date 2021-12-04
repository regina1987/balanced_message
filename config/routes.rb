Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'messages/new', to: 'messages#new', as: 'messages_new'
  post 'messages', to: 'messages#create'
  get 'messages/index', to: 'messages#index'
  root to: 'messages#index'
end
