class SubscriptionsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_blog

    def create
        @subscription = @blog.subscriptions.new(subscription_params)
        if @subscription.save
            redirect_to new_blog_subscription_path
            flash[:notice] = "Thanks for subscribing!"
        else
            render "new"
        end
    end

    def new
        @subscription = Subscription.new
    end


    private

    def find_blog
        @blog = Blog.find(params[:blog_id])
    end

    def subscription_params
        params.require(:subscription).permit(:first_name, :last_name, :email)
    end

end
