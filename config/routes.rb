Rails.application.routes.draw do
  devise_for :users
  root 'prefectures#index'
  resources :prefectures, only: :index do
    resources :recruitments, only: :index
  end
  resources :users, only: :show
end
