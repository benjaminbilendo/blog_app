class AddNotifiedToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :notified, :boolean, default: false
  end
end
