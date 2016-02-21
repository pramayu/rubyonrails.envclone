class CreateCompatibles < ActiveRecord::Migration
  def change
    create_table :compatibles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
