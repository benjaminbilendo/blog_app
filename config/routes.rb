require "resque_web"

Rails.application.routes.draw do
    mount ResqueWeb::Engine => "/resque_web"
    root to: "blogs#index"
    devise_for :users
    resources :subscriptions
       resources :blogs do
    resources :comments
    end
end
