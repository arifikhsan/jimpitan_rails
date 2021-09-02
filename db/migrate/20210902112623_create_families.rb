class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|
      t.references :village, null: false, foreign_key: true
      t.string :householder

      t.timestamps
    end
  end
end
