Rails.application.routes.draw do
  root 'prefectures#index'
  # root 'recruitments#index'
  resources :prefectures, only: :index do
    resources :recruitments, only: :index
  end
end
