class Subscription < ApplicationRecord
    belongs_to :blog
    validates :first_name, length: { minimum: 5 }
    validates :last_name, length: { minimum: 10 }

end
