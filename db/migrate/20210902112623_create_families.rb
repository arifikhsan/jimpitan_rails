class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|
      t.references :village, null: false, foreign_key: true
      t.string :householder
      t.integer :rt
      t.integer :rw
      t.integer :number
      t.text :detail

      t.timestamps
    end
  end
end
