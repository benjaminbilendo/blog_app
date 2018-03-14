class Blog < ApplicationRecord
    extend FriendlyId
    mount_uploader :image, ImageUploader
    scope :active, -> {where(:active => true)}
    friendly_id :title, use: [:slugged, :finders]
    has_many :comments, dependent: :destroy
    validates :title, presence: true
    validates :title, length: { minimum: 5 }
    self.per_page = 2


    def self.send_subscription_emails
        UserMailer.welcome_email.deliver
    end

    def activate
        self.active = true
    end

end

