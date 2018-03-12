class UserMailer < ApplicationMailer


    include Resque::Mailer

    def welcome_email
        @emails = Subscription.all.collect(&:email).join(", ")
        mail(to: @emails, subject: "Thanks for subscribing")
    end
end
