class NotifySubscribers

    @queue = :image

    def self.perform(blog_id)
        Subscription.all.each do |subscription|
            UserMailer.new_post(blog_id, subscription.id).deliver
        end
    end
end
