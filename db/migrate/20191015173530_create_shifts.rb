class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.datetime :start, null: false
      t.datetime :finish, null: false
      t.integer :break, default: 0
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
