Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :members
  resources :matches, only: [:index, :new, :create]
  root to: 'leaderboard#show', as: "leaderboard"
end
