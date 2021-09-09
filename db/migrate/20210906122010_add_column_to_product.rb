class AddColumnToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :region, null: false, foreign_key: true
  end
end
