class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :user_id
      t.integer :book_id
      t.integer :pay
      t.integer :affect
      t.integer :delete_yn
      t.integer :number

      t.timestamps
    end
  end
end
