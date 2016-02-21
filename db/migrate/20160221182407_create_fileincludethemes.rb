class CreateFileincludethemes < ActiveRecord::Migration
  def change
    create_table :fileincludethemes do |t|
      t.references :theme, index: true, foreign_key: true
      t.references :fileinclude, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
