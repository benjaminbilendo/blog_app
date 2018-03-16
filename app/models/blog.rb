class Blog < ApplicationRecord
    has_many :comments, dependent: :destroy

    validates :title, presence: true
    validates :title, length: { minimum: 5 }

    mount_uploader :image, ImageUploader


    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]

    scope :published_posts, -> {where(active: true)}

    self.per_page = 4

    after_commit :enqueue_counterworker, on: [:create, :update]
    after_commit :emailsworker, on: [:create, :update]

    def self.send_subscription_emails
        UserMailer.welcome_email.deliver
    end

    private

    def enqueue_counterworker
        Resque.enqueue(Counter, id)
    end

    def emailsworker
        if active && !notified
            Resque.enqueue(NotifySubscribers, id)
            update(notified: true)
        end
    end
end
