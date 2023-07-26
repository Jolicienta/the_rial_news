Rails.application.routes.draw do
  resources :posts
  devise_for :users

  post '/new_user_reaction', to: 'reactions#new_user_reaction', as: 'new_user_reaction'

  # resources :comments, only: [:create]
  resources :comments, only: [:create] do
    post :create_anonymous_comment, on: :collection
  end

  root "posts#index"
end
