class AddBlogToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_reference :subscriptions, :blog, foreign_key: true
  end
end
