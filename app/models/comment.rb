class Comment < ApplicationRecord
    belongs_to :blog

    validates :body, presence: true
    validates :body, length: { minimum: 5 }
    validates :commenter, presence: true
    validates :body, format: { with: /\A[a-zA-Z]+\z/, message: 'Only Letters are allowed!'}
    validates :body, presence: true

    extend FriendlyId
    friendly_id :comment_slug, use: [:slugged, :finders]

    scope :active, -> {where(active: true)}

    def comment_slug
        "#{commenter} #{created_at.to_i}"
    end
end
