class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.float :hourly_rate, null: false

      t.timestamps
    end
  end
end
