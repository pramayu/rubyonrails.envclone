class CreateCompatiblethemes < ActiveRecord::Migration
  def change
    create_table :compatiblethemes do |t|
      t.references :theme, index: true, foreign_key: true
      t.references :compatible, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
