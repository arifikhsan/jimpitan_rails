class CreateVillageDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :village_donations do |t|
      t.references :village, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
