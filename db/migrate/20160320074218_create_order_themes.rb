class CreateOrderThemes < ActiveRecord::Migration
  def change
    create_table :order_themes do |t|
      t.references :theme, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.decimal :unit_price, precision: 12, scale: 3
      t.decimal :total_price, precision: 12, scale: 3

      t.timestamps null: false
    end
  end
end
