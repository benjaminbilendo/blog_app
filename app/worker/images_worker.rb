class ImagesWorker

    @queue = :image

    def self.perform
        Blog.find_each do |ym|
            Resque.enqueue(ImageWorker, ym.id)
        end
    end
end
