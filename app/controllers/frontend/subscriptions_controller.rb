module Frontend
    class SubscriptionsController < ApplicationController
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
