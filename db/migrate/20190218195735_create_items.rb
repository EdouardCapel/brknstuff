class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :description
      t.integer :price
      t.integer :level

      t.timestamps
    end
  end
end
