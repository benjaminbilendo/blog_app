class Comment < ApplicationRecord
    extend FriendlyId
    scope :active, -> {where(:active => true)}
    friendly_id :comment_slug, :use => [:slugged, :finders]
    validates :commenter, presence: true
    validates :commenter, length: { minimum: 5 }
    validates :commenter, :body, presence: true
    belongs_to :blog

    def comment_slug
        "#{commenter} #{Time.zone.now.to_i}"
    end


    def self.filter(params)
        return true if params.include?("dislike")
    end

end



