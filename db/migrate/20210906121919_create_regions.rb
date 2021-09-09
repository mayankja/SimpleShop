class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :title
      t.references :country_detail, null: false, foreign_key: true
      t.string :currency
      t.references :tax, null: false, foreign_key: true

      t.timestamps
    end
  end
end
