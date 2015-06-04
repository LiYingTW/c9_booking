class User < ActiveRecord::Base
    validates_presence_of :account, :password, :name, :cell_phone, :privilege, :email, :email_yn
    
    has_many :order
    
    def is_admin?
        if privilege == 0
            return true
        else
            return false
        end
    end
end
