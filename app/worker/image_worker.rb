class ImageWorker
    @queue = :image
    def self.perform(blog_id)
        begin
            blog = Blog.find(blog_id)
            blog.image.recreate_versions! if blog.image?
            blog.save!
        rescue => e
            puts  "ERROR: YourModel: #{ym.id} -> #{e.to_s}"
        end
    end
end
