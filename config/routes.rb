# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
    }
  root 'prefectures#index'
  resources :prefectures, only: :index do
    resources :recruitments, only: :index
  end
  resources :users, only: :show
end
