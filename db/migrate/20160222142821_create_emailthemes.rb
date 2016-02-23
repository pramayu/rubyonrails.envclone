class CreateEmailthemes < ActiveRecord::Migration
  def change
    create_table :emailthemes do |t|
      t.references :theme, index: true, foreign_key: true
      t.references :email, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
