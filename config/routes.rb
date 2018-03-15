require "resque_web"

Rails.application.routes.draw do
    mount ResqueWeb::Engine => "/resque_web"

    devise_for :users

    namespace :backend do
        get 'comments', to: 'comments#index'
        resources :blogs, except: [:show] do
            resources :comments, except: [:create, :new, :show, :index]
        end
    end

    namespace :frontend do
        resources :blogs, only: [:index, :show] do
            resources :comments, only: [:create, :new, :show, :index]
        end
    end

    root to: "frontend/blogs#index"
    get '/subscribe', to: 'frontend/subscriptions#new'
    post '/subscribe', to: 'frontend/subscriptions#create'
    post '/:id/create_comment', to: 'frontend/comments#create', as: 'createcomment'

end

