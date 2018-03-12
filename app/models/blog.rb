class Blog < ApplicationRecord
    extend FriendlyId
    mount_uploader :image, ImageUploader
    scope :active, -> {where(:active => true)}
    friendly_id :title, :use => [:slugged, :finders]
    has_many :comments, :dependent => :destroy
    has_many :subscriptions
    validates :title, presence: true
    validates :title, length: { minimum: 5 }
    self.per_page = 2
end

