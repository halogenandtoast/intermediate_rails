require "monban/constraints/signed_in"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  root "welcome#index"

  resources :shouts, only: [:create] do
    member do
      post "reshout" => "reshouts#create"
      delete "unreshout" => "reshouts#destroy"
    end
  end

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show] do
    member do
      post "follow" => "following_relationships#create"
      delete "unfollow" => "following_relationships#destroy"
    end
  end
end
