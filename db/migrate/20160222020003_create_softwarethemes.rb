class CreateSoftwarethemes < ActiveRecord::Migration
  def change
    create_table :softwarethemes do |t|
      t.references :theme, index: true, foreign_key: true
      t.references :software, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
