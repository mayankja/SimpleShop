class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :pincode
      t.string :house_num
      t.string :area
      t.string :city
      t.string :state
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
