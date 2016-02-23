class CreateDevicethemes < ActiveRecord::Migration
  def change
    create_table :devicethemes do |t|
      t.references :theme, index: true, foreign_key: true
      t.references :device, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
