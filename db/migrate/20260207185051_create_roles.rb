class CreateRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :roles do |t|
      t.string "role_name"
      t.integer "billing_order"
      t.integer "actor_id"
      t.integer "movie_id"

      t.timestamps
    end
  end
end
