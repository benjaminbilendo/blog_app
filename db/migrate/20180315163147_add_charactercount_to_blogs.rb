class AddCharactercountToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :charactercount, :integer
  end
end
