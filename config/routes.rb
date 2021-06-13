# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users
  root 'prefectures#index'
  resources :prefectures, only: :index do
    resources :recruitments do
      resources :comments, only: :create
      resource :likes, only: %i[create destroy]
    end
  end
  resources :users, only: %i[show edit update]
end
