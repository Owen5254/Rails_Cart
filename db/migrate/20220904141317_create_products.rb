class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
