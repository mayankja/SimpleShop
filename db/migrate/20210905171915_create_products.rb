class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :image
      t.float :price
      t.string :sku
      t.string :stock_number

      t.timestamps
    end
  end
end
