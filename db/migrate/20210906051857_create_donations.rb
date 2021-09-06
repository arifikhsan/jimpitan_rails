class CreateDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :donations do |t|
      t.references :village, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true
      t.date :date
      t.integer :content
      t.integer :money_value
      t.datetime :taken_on

      t.timestamps
    end
  end
end
