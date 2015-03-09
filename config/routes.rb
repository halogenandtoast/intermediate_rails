require "monban/constraints/signed_in"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  root "welcome#index"

  resources :shouts, only: [:create]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
