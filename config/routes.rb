require "resque_web"

Rails.application.routes.draw do
    mount ResqueWeb::Engine => "/resque_web"
    root to: "blogs#index"
    devise_for :users

# Front End

    get '/blog/subscribe', to: 'subscriptions#new'
    post '/blog/subscribe', to: 'subscriptions#create'
    get '/home', to: 'blogs#index'
    get '/home/blogs/:id', to: 'blogs#show'

# Back End

    resources :blogs do
        resources :comments, only: [:create]
    end
end


