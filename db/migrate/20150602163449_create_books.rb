class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :bookname
      t.string :isbn
      t.string :coursename
      t.integer :price
      t.integer :price_single
      t.integer :price_team
      t.integer :team_limit
      t.datetime :booking_deadline
      t.integer :state
      t.integer :price_booking
      t.string :comment
      t.datetime :pay_deadline

      t.timestamps
    end
  end
end
