class Wordfilter

    @queue = :filter

    def self.perform(params)
        return true if params.include?("dislike")
    end
end
