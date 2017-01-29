class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :product_id
      t.float :total

      t.timestamps
    end
  end
end
