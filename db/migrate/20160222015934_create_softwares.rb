class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
