module Backend
    class SubscriptionsController < ApplicationController
        before_action :find_subscription
        def create
            @subscription = Subscription.new(subscription_params)
            if @subscription.save
                redirect_to root_path, alert: "Thanks for subscribing"
            else
                render "new"
            end
        end

        def new
            @subscription = Subscription.new
        end


        private

        def subscription_params
            params.require(:subscription).permit(:first_name, :last_name, :email)
        end
    end
end




before_action :find_blog, only: [:show, :edit, :update, :destroy, :active]

def index
    @blogs = Blog.all.paginate(page: params[:page])
end

def create
    @blog = Blog.new(blog_params)
    if @blog.save
        redirect_to backend_blogs_path, notice: "Success!"
    else
        render "new"
    end
end

def edit
end

def new
    @blog = Blog.new
end

def update
    if @blog.update(blog_params)
      redirect_to backend_blogs_path
    else
      render 'edit'
    end
end

def destroy
    @blog.destroy
    flash[:notice] = "Delete success"
    redirect_to backend_blogs_path
end
