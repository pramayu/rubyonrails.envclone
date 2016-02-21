class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :resolution
      t.string :layout
      t.string :demo

      t.timestamps null: false
    end
  end
end
