class DoStuffWorker
    @queue = :low

    def self.perform(*args)
        sleep 1
        p args
    end
end
