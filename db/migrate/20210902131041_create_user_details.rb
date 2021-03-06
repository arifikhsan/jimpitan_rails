class CreateUserDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :user_details do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :phone
      t.integer :rt
      t.integer :rw
      t.text :address

      t.timestamps
    end
  end
end
