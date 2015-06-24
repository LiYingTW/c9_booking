class Book < ActiveRecord::Base
    validates_presence_of :bookname, :isbn, :coursename, :price, :price_booking, :price_single, :price_team, :team_limit, :state, :price_booking, :booking_deadline, :pay_deadline
    validates_numericality_of :price, :price_booking, :price_booking, :price_team, :team_limit, :greater_than_or_equal_to => 0
    
    has_many :order
end
