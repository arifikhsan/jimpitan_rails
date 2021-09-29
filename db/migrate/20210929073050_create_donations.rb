class CreateDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :donations do |t|
      t.references :village, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true
      t.references :patrol_member, null: false, foreign_key: true
      t.references :village_donation, null: false, foreign_key: true
      t.date :date
      t.datetime :taken_at

      t.timestamps
    end
  end
end
