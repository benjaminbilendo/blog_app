class Subscription < ApplicationRecord
    validates :email, presence: true

    def name
        "#{first_name} #{last_name}"
    end
end
