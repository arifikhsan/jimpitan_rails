class CreateVillageDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :village_donations do |t|
      t.references :village, null: false, foreign_key: true
      t.string :title
      t.integer :content
      t.integer :value

      t.timestamps
    end
  end
end
