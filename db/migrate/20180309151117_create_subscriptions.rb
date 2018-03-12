class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    drop_table :subscriptions
    create_table :subscriptions do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :blog, foreign_key: true
      t.timestamps
    end
  end
end