class AddForeignKeyToSubscriptions < ActiveRecord::Migration[5.1]
  def change
      add_foreign_key :subscriptions, :blogs
  end
end
