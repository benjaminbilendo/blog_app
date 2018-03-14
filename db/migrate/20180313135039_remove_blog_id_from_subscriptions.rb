class RemoveBlogIdFromSubscriptions < ActiveRecord::Migration[5.1]
  def change
      remove_reference :subscriptions, :blog_id, index: true, foreign_key: true
  end
end
