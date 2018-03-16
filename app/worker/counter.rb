class Counter
  @queue = :count

  def self.perform(blog_id)
    blog = Blog.find(blog_id)

    blog.update_columns(
      wordcount:       blog.text.split(' ').count,
      charactercount:  blog.text.delete(' ').size,
      whitespacecount: blog.text.count(' ')
    )
  end
end
