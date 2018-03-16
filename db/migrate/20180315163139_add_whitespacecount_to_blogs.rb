class AddWhitespacecountToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :whitespacecount, :integer
  end
end
