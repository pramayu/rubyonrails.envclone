class CreateBrowserthemes < ActiveRecord::Migration
  def change
    create_table :browserthemes do |t|
      t.references :theme, index: true, foreign_key: true
      t.references :browser, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
