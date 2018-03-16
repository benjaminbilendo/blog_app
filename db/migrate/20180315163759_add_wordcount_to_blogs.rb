class AddWordcountToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :wordcount, :integer
  end
end
