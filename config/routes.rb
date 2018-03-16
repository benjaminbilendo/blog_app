require "resque_web"

Rails.application.routes.draw do
    mount ResqueWeb::Engine => "/resque_web"

    #devise_for :users

    namespace :backend do
        resources :subscriptions, except: [:show]
        get 'comments', to: 'comments#index'
        resources :blogs, except: [:show] do
            resources :comments, except: [:create, :new, :show, :index]
        end
    end

    put 'recreate_images', to: 'backend/blogs#change_size'

    post '/:blog_id/comments', to: 'frontend/comments#create', as: 'new_comment'

    root to: "frontend/blogs#index"
    get '/subscribe', to: 'frontend/subscriptions#new'
    post '/subscribe', to: 'frontend/subscriptions#create'
    post '/:id/create_comment', to: 'frontend/comments#create', as: 'createcomment'
    get '/:id', to: 'frontend/blogs#show', as: 'blog'

end

