class AddActiveToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :active, :boolean
  end
end
