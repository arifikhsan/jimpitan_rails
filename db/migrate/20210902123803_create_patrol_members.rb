class CreatePatrolMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :patrol_members do |t|
      t.references :village, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :day_in_week

      t.timestamps
    end
  end
end
