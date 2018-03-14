class Subscription < ApplicationRecord
    validates :first_name, length: { minimum: 5 }
    validates :last_name, length: { minimum: 10 }
    validates_format_of :email, with: Devise::email_regexp
end
