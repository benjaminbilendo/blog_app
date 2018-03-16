class RemoveFieldnameFromBlogs < ActiveRecord::Migration[5.1]
  def change
      remove_column :blogs, :fieldname
  end
end
