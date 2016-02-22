class CreateFrameworkthemes < ActiveRecord::Migration
  def change
    create_table :frameworkthemes do |t|
      t.references :theme, index: true, foreign_key: true
      t.references :framework, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
