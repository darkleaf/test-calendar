class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id

      t.string :name
      t.date :date
      t.integer :repeat_period

      t.timestamps null: false
    end
  end
end
