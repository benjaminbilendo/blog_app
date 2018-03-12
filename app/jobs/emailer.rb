class Emailer < UserMailer

   def self.perform
         UserMailer.welcome_email
    end
end
