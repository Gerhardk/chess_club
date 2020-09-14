Rails.application.routes.draw do
  get 'members/index'
  get 'members/show'
  get 'members/new'
  get 'members/edit'
  get 'members/create'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :members
  root to: 'leaderboard#show', as: "leaderboard"
end
