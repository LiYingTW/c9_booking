class Order < ActiveRecord::Base
    validates_presence_of :user_id, :pay, :affect, :delete_yn, :number

    belongs_to :user
    belongs_to :book
end
