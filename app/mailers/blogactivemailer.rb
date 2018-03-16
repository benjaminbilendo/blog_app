class BlogActiveMailer < ApplicationMailer


    include Resque::Mailer

    def new_post
        @emails = Subscription.all.collect(&:email).join(", ")
        mail(to: @emails, subject: "Thanks for subscribing")
    end
end
