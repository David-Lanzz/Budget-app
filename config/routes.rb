# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users, only: [:index] do
    resources :categories, only: %i[index create new show] do
      resources :entities, only: %i[create new]
    end
  end

  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'

  root 'pages#splash'
end
