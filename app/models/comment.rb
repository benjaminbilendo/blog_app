class Comment < ApplicationRecord
    extend FriendlyId
    scope :active, -> {where(:active => true)}
    friendly_id :comment_slug, use: [:slugged, :finders]
    validates :body, presence: true
    validates :body, length: { minimum: 5,  message: "Must be over 20 characters" }
    validates :commenter, presence: true
    validates :body, format: { with: /\A[a-zA-Z]+\z/, message: "Only Letters are allowed!"}
    validates :body, presence: true
    belongs_to :blog

    def comment_slug
        "#{commenter} #{Time.zone.now.to_i}"
    end

end



