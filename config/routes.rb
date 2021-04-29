# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'prefectures#index'
  resources :prefectures, only: :index do
    resources :recruitments, only: %i[index new create show]
  end
  resources :users, only: %i[show edit update]
end
