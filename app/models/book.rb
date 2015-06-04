class Book < ActiveRecord::Base
    validates_presence_of :bookname, :isbn, :coursename
    
    has_many :order
end
