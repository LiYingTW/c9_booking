class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account
      t.string :password
      t.string :name
      t.string :cell_phone
      t.string :email
      t.integer :email_yn
      t.integer :privilege

      t.timestamps
    end
  end
end
