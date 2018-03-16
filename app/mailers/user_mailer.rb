class UserMailer < ApplicationMailer

    include Resque::Mailer

    def new_post(blog_id, subscription_id)
        @blog = Blog.find(blog_id)
        @subscription = Subscription.find(subscription_id)

        mail(to: @subscription.email, subject: "See my new post: #{@blog.title}")
    end
end
