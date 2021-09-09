class CreateTaxes < ActiveRecord::Migration[6.0]
  def change
    create_table :taxes do |t|
      t.string :tax_name
      t.decimal :tax_percentage

      t.timestamps
    end
  end
end
